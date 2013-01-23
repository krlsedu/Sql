select * from bethadba.itbi_opcoes_cidadao_web where i_solicitacoes = 161 and (i_item = 50099 or i_item = 36099)

update bethadba.itbi_opcoes_cidadao_web io set valor = (select valor from bethadba.itbi_opcoes_cidadao_web where i_solicitacoes = io.i_solicitacoes and i_item = 50099
)  where io.i_solicitacoes = 161 and  io.i_item = 36099;

update bethadba.itbi_opcoes_cidadao_web io set valor = 1487.69  where io.i_solicitacoes = 161 and  io.i_item = 50099;
commit;
select * from bethadba.itbi_opcoes_cidadao_web where i_solicitacoes = 161 and (i_item = 50099 or i_item = 36099)


update bethadba.itbi_opcoes_cidadao_web io set valor = (select valor from bethadba.itbi_opcoes_cidadao_web where i_solicitacoes = io.i_solicitacoes and i_item = 51099
)  where io.i_solicitacoes = 136 and  io.i_item = 37099;

update bethadba.itbi_opcoes_cidadao_web io set valor = 46.77  where io.i_solicitacoes = 136 and  io.i_item = 51099;
commit;
