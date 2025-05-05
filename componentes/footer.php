<div class="container">
  <footer class="py-3 my-4">
    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
      <?php if (!empty($menu)): ?>
      <?php foreach ($menu as $m): ?>
        <li class="nav-item"><a href="<?= $m['url']."?tema=".$_GET['tema'] ?>" class="nav-link px-2 text-body-secondary"><?= htmlspecialchars($m['titulo']) ?></a></li>
      <?php endforeach; ?>
      <?php else: ?>
        <div class="alert alert-danger" role="alert">
          No hay menu configurado.
        </div>
      <?php endif; ?>
    </ul>
    <p class="text-center text-body-secondary">© 2025 Company, Inc</p>
  </footer>
</div>