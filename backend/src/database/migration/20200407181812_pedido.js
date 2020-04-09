
exports.up = function(knex) {
  return knex.schema.createTable("pedido", function(table){
    table.string('uid').primary();
    table.string("user_id").notNullable();
    table.string('items').notNullable();
    table.decimal('price').notNullable();

    table.foreign('user_id').references('uid').inTable('user');
  });
};

exports.down = function(knex) {
  knex.schema.dropTable('pedido');
};
