# ADICIONAL idear editar contenido de la tarea
require 'sinatra'
require 'make_todo'

# Lista
get '/' do
  @tareas = Tarea.all
  erb :index
end

# Crear
get '/tarea/nueva' do
  erb :nueva
end

post '/tarea' do
  # podría hacerlo con name ? pero deberia crear otra ruta?
  Tarea.create(params[:tarea])
  redirect '/'
end

# Editar/actualizar
post '/tarea/edit/:id' do
  # Vuelve y juega con el tipo de variables S
  tarea = Tarea.find(params[:id])
  Tarea.update(tarea["id"])
  redirect '/'
end

# Eliminar
post '/tarea/:id' do
  # Vuelve y juega con el tipo de variables S
  tarea = Tarea.find(params[:id])
  Tarea.destroy(tarea["id"])
  redirect '/'
end
