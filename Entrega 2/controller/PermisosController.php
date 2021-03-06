<?php
require_once "./model/UsuarioModel.php";
require_once "./view/PermisosView.php";


class PermisosController
{
  private $model;
  private $view;
  function __construct()
  {
      $this->view = new PermisosView();
      $this->model = new UsuarioModel();
  }
  public function mostrarUsuarios(){
    session_start();
    if(isset($_SESSION['ADMIN']) && $_SESSION['ADMIN'] == 1){
      $users = $this->model->getUsers();
      $this->view->mostrarUsuarios($users);
    }
  }
  public function actualizarUsuario(){
    session_start();
    if(isset($_SESSION['ADMIN']) && $_SESSION['ADMIN'] == 1){
      $values = array($_POST['usuario'],(int)$_POST['admin'],(int)$_POST['id']);
      $this->model->actualizarUsuario($values);
    }

    PageHelpers::PermisosPage();
  }
  public function borrarUsuario($params = []){
    session_start();
    if(isset($_SESSION['ADMIN']) && $_SESSION['ADMIN'] == 1){
      $this->model->borrarUsuario([$params[0]]);
    }
    PageHelpers::PermisosPage();
  }
}
