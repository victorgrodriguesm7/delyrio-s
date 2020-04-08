
exports.up = function(knex) {
  return knex.schema.createTable('cardapio', function(table){
      table.string('uid').primary();
      table.string("name").notNullable();
      table.string("description").notNullable();
      table.decimal('price').notNullable();
  })
};

exports.down = function(knex) {
  knex.schema.dropTable('cardapio');
};