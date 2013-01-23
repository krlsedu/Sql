select 
    (select max(i_ruas) from bethadba.ruas where nome like trim(replace(replace(replace(replace(replace(pe.nome_rua,'RUA ',''),'TV ',''),'AV ',''),'R ',''),'AV. ','')) ),
    trim(replace(replace(replace(replace(replace(pe.nome_rua,'RUA ',''),'TV ',''),'AV ',''),'R ',''),'AV. ','')) 
from
    bethadba.nfe_erros_ocorridos nfee,
    bethadba.pessoas_enderecos pe
where
    nfee.numero_doc = pe.i_pessoas and
    mensagem = 'O número do IBGE do logradouro é obrigatório.' and situacao = 'N' and
    i_ruas is null and
     (select max(i_ruas) from bethadba.ruas where nome like trim(replace(replace(replace(replace(replace(pe.nome_rua,'RUA ',''),'TV ',''),'AV ',''),'R ',''),'AV. ','')) ) is not null
group by 
    numero_doc,
    nome_rua;

insert into bethadba.conexoes_usr
values(1,year(today()),301);

set @@sist_betha_corrente = @@betha_tributos;
commit;    

update
    bethadba.nfe_erros_ocorridos nfee,
    bethadba.pessoas_enderecos pe
set
    pe.i_ruas =  (select max(i_ruas) from bethadba.ruas where nome like trim(replace(replace(replace(replace(replace(pe.nome_rua,'RUA ',''),'TV ',''),'AV ',''),'R ',''),'AV. ','')) ),
    nome_rua = null
where
    nfee.numero_doc = pe.i_pessoas and
    mensagem = 'O número do IBGE do logradouro é obrigatório.' and situacao = 'N' and
    i_ruas is null and
     (select max(i_ruas) from bethadba.ruas where nome like trim(replace(replace(replace(replace(replace(pe.nome_rua,'RUA ',''),'TV ',''),'AV ',''),'R ',''),'AV. ','')) ) is not null

commit


