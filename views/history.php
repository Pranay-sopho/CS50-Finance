<table style="width: 100%">
    <tr>
        <th>Status</th>
        <th>Symbol</th>
        <th>Shares</th>
        <th>Price</th>
        <th>Timestamp</th>
    </tr>
    <?php foreach ($positions as $position): ?>
    
        <tr>
            <td><?= $position["status"] ?></td>
            <td><?= $position["symbol"] ?></td>
            <td><?= $position["shares"] ?></td>
            <td><?= $position["price"] ?></td>
            <td><?= $position["timestamp"] ?></td>
        </tr>
        
    <?php endforeach ?>
</table>
