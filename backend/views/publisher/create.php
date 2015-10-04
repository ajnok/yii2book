<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\Publisher */

$this->title = Yii::t('app', 'Create Publisher');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Publishers'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="publisher-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
