<table style="width: 100%">
    <tr>
        <th>Name</th>
        <th>Symbol</th>
        <th>Shares</th>
        <th>Price</th>
    </tr>
    <?php foreach ($positions as $position): ?>
    
        <tr>
            <td><?= $position["name"] ?></td>
            <td><?= $position["symbol"] ?></td>
            <td><?= $position["shares"] ?></td>
            <td><?= $position["price"] ?></td>
        </tr>
        
    <?php endforeach ?>
</table>
<h1>You have <?= $cash ?> left.<h1>
