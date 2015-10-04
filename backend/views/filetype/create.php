<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Filetype */

$this->title = Yii::t('app', 'Create Filetype');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Filetypes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="filetype-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
