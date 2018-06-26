From: jakub.kicinski@netronome.com (Jakub Kicinski)
Date: Mon, 25 Jun 2018 18:00:02 -0700
Subject: [PATCH v2 net-next 3/4] netdevsim: add ipsec offload testing
In-Reply-To: <1529970096-23199-4-git-send-email-shannon.nelson@oracle.com>
References: <1529970096-23199-1-git-send-email-shannon.nelson@oracle.com>
 <1529970096-23199-4-git-send-email-shannon.nelson@oracle.com>
Message-ID: <20180625180002.1e6aff2d@cakuba.netronome.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180626010002.7llzZ14tCZwXkFFhnNqqj4IX7wAa7Z5TH1tJVx6C7hw@z>

On Mon, 25 Jun 2018 16:41:35 -0700, Shannon Nelson wrote:
> Implement the IPsec/XFRM offload API for testing.
> 
> Signed-off-by: Shannon Nelson <shannon.nelson at oracle.com>
> ---
> V2 - addressed formatting comments from Jakub Kicinski

Thanks!  One more comment below, otherwise:

Reviewed-by: Jakub Kicinski <jakub.kicinski at netronome.com>

> +static void nsim_ipsec_del_sa(struct xfrm_state *xs)
> +{
> +	struct net_device *dev = xs->xso.dev;
> +	struct netdevsim *ns = netdev_priv(dev);
> +	struct nsim_ipsec *ipsec = &ns->ipsec;
> +	u16 sa_idx;

I didn't point this out, but above also breaks the reverse xmas tree
rule.  Sorry for not mentioning it, the "please fix everywhere" was
implicit :(

> +	sa_idx = xs->xso.offload_handle & ~NSIM_IPSEC_VALID;
> +	if (!ipsec->sa[sa_idx].used) {
> +		netdev_err(dev, "Invalid SA for delete sa_idx=%d\n", sa_idx);
> +		return;
> +	}
> +
> +	memset(&ipsec->sa[sa_idx], 0, sizeof(struct nsim_sa));
> +	ipsec->count--;
> +}
> +
> +static bool nsim_ipsec_offload_ok(struct sk_buff *skb, struct xfrm_state *xs)
> +{
> +	struct net_device *dev = xs->xso.dev;
> +	struct netdevsim *ns = netdev_priv(dev);

And here, but you don't use the dev here, so you can just inline the
xs->xso.dev into netdev_priv().

> +	struct nsim_ipsec *ipsec = &ns->ipsec;
> +
> +	ipsec->ok++;
> +
> +	return true;
> +}

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
