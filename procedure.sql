CREATE PROCEDURE setDepartamento   
    @codigo_departamento_param int,   
    @nome_responsavel_param varchar(250),
	@login_responsavel_param varchar(250),
	@email_responsavel_param varchar(250)

AS 
	IF EXISTS (SELECT * FROM departamento WHERE id_departamento = @codigo_departamento_param) 
	BEGIN
		UPDATE departamento
		SET 
			nome_responsavel = @nome_responsavel_param,
			login_responsavel = @login_responsavel_param,
			email_responsavel = @email_responsavel_param
		WHERE id_departamento = @codigo_departamento_param	
	END
	ELSE
	BEGIN
		INSERT INTO departamento
		VALUES(
			@codigo_departamento_param,
			@nome_responsavel_param,
			@login_responsavel_param,
			@email_responsavel_param
		)			
	END;
GO  