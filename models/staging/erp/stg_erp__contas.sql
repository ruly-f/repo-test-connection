with
    fonte_contas as (
        select *
        from {{ source('erp', 'contas') }}
    )
    
    , renamed as (
        select 
            num_conta as pk_conta
            , cod_cliente as fk_cliente
            , cod_agencia as fk_agencia
            , cod_colaborador as fk_colaborador
            , num_conta as numero_conta
            , tipo_conta
            , cast(data_abertura as timestamp) as ts_abertura_conta
            , cast(saldo_total as numeric(32,2)) as saldo_total
            , cast(saldo_disponivel as numeric(32,2)) as saldo_disponivel
            , cast(data_ultimo_lancamento as timestamp) as ts_ultimo_lancamento
        from fonte_contas
    )

select *
from renamed
