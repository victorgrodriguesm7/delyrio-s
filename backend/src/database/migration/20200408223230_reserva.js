
exports.up = function(knex) {
  return knex.schema.createTable('reserva', function(table){
    table.string('uid').primary();
    table.string('user_id').notNullable();
    table.decimal('numeroMesa',2).notNullable();
    table.datetime('hora').notNullable();

    table.foreign('user_id').references('uid').inTable('user');
  });
};

exports.down = function(knex) {
  knex.schema.dropTable('reserva');
};
