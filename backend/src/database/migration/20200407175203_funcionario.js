
exports.up = function(knex) {
  return knex.schema.createTable('funcionario', function(table){
    table.string('uid').primary();
    table.string("name").notNullable();
    table.string('password').notNullable();
    table.string('token').notNullable();
  });
};

exports.down = function(knex) {
  knex.schema.dropTable('funcionario');
};
