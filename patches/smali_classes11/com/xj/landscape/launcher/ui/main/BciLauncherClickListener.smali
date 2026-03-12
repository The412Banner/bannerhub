.class public final Lcom/xj/landscape/launcher/ui/main/BciLauncherClickListener;
.super Ljava/lang/Object;
.implements Landroid/view/View$OnClickListener;

.field private final context:Landroid/content/Context;

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xj/landscape/launcher/ui/main/BciLauncherClickListener;->context:Landroid/content/Context;

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    # Get PackageManager
    iget-object v0, p0, Lcom/xj/landscape/launcher/ui/main/BciLauncherClickListener;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    # Get launch Intent for BannersComponentInjector
    const-string v2, "com.banner.inject"

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v1

    # If null, app is not installed — show toast
    if-eqz v1, :not_installed

    # Launch BCI
    iget-object v0, p0, Lcom/xj/landscape/launcher/ui/main/BciLauncherClickListener;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    :not_installed

    iget-object v0, p0, Lcom/xj/landscape/launcher/ui/main/BciLauncherClickListener;->context:Landroid/content/Context;

    const-string v1, "BannersComponentInjector is not installed"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
