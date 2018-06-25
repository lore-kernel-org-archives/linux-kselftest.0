From: jakub.kicinski@netronome.com (Jakub Kicinski)
Date: Mon, 25 Jun 2018 16:09:33 -0700
Subject: [PATCH net-next 3/4] netdevsim: add ipsec offload testing
In-Reply-To: <c9658422-13a3-b926-cc18-c759a1a0d343@oracle.com>
References: <1529713898-9200-1-git-send-email-shannon.nelson@oracle.com>
 <1529713898-9200-4-git-send-email-shannon.nelson@oracle.com>
 <20180622210708.43d50d15@cakuba.netronome.com>
 <c9658422-13a3-b926-cc18-c759a1a0d343@oracle.com>
Message-ID: <20180625160933.12a9623d@cakuba.netronome.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180625230933.VuUAdzPgd8qB3vEgS7hgwJW5CUEuUsxIh3jHjN31u4g@z>

On Mon, 25 Jun 2018 15:37:10 -0700, Shannon Nelson wrote:
> On 6/22/2018 9:07 PM, Jakub Kicinski wrote:
> > On Fri, 22 Jun 2018 17:31:37 -0700, Shannon Nelson wrote:  
> >> Implement the IPsec/XFRM offload API for testing.
> >>
> >> Signed-off-by: Shannon Nelson <shannon.nelson at oracle.com>  
> >> +#define NSIM_IPSEC_AUTH_BITS	128
> >> +
> >> +/**
> >> + * nsim_ipsec_dbg_read - read for ipsec data
> >> + * @filp: the opened file
> >> + * @buffer: where to write the data for the user to read
> >> + * @count: the size of the user's buffer
> >> + * @ppos: file position offset
> >> + **/
> >> +static ssize_t nsim_dbg_netdev_ops_read(struct file *filp,  
> > 
> > Doesn't match the kdoc.  Please run
> > 
> > ./scripts/kernel-doc -none $file
> > 
> > if you want kdoc.  Although IMHO you may as well drop the kdoc, your
> > code is quite self explanatory and local.  
> 
> By adding -v to that I got a couple of warnings that I didn't include 
> the Return information - is that what you were commenting on?  The rest 
> seems acceptable to the script I'm using from the net-next tree.

Hm, strange.  Two things: first kdoc requires () after function name,
second the function is called nsim_dbg_netdev_ops_read() while the doc
refers to nsim_ipsec_dbg_read().  Perhaps the combination of the two
makes the script miss the problem. 

> >> +					char __user *buffer,
> >> +					size_t count, loff_t *ppos)
> >> +{
> >> +	struct netdevsim *ns = filp->private_data;
> >> +	struct nsim_ipsec *ipsec = &ns->ipsec;
> >> +	size_t bufsize;
> >> +	char *buf, *p;
> >> +	int len;
> >> +	int i;
> >> +
> >> +	/* don't allow partial reads */
> >> +	if (*ppos != 0)
> >> +		return 0;
> >> +
> >> +	/* the buffer needed is
> >> +	 * (num SAs * 3 lines each * ~60 bytes per line) + one more line
> >> +	 */
> >> +	bufsize = (ipsec->count * 4 * 60) + 60;
> >> +	buf = kzalloc(bufsize, GFP_KERNEL);
> >> +	if (!buf)
> >> +		return -ENOMEM;
> >> +
> >> +	p = buf;
> >> +	p += snprintf(p, bufsize - (p - buf),
> >> +		      "SA count=%u tx=%u\n",
> >> +		      ipsec->count, ipsec->tx);
> >> +
> >> +	for (i = 0; i < NSIM_IPSEC_MAX_SA_COUNT; i++) {
> >> +		struct nsim_sa *sap = &ipsec->sa[i];
> >> +
> >> +		if (!sap->used)
> >> +			continue;
> >> +
> >> +		p += snprintf(p, bufsize - (p - buf),
> >> +			      "sa[%i] %cx ipaddr=0x%08x %08x %08x %08x\n",
> >> +			      i, (sap->rx ? 'r' : 't'), sap->ipaddr[0],
> >> +			      sap->ipaddr[1], sap->ipaddr[2], sap->ipaddr[3]);
> >> +		p += snprintf(p, bufsize - (p - buf),
> >> +			      "sa[%i]    spi=0x%08x proto=0x%x salt=0x%08x crypt=%d\n",
> >> +			      i, be32_to_cpu(sap->xs->id.spi),
> >> +			      sap->xs->id.proto, sap->salt, sap->crypt);
> >> +		p += snprintf(p, bufsize - (p - buf),
> >> +			      "sa[%i]    key=0x%08x %08x %08x %08x\n",
> >> +			      i, sap->key[0], sap->key[1],
> >> +			      sap->key[2], sap->key[3]);
> >> +	}
> >> +
> >> +	len = simple_read_from_buffer(buffer, count, ppos, buf, p - buf);  
> > 
> > Why not seq_file for this?  
> 
> Why bother with more interface code?  This is useful enough to support 
> the API testing needed.

No objection on this, seq_file is less error prone, but I don't mind.
FWIW you can drop the *ppos == 0 requirement, simple_read_from_buffer()
will handle other cases just fine.

> >> +	kfree(buf);
> >> +	return len;
> >> +}
> >> +
> >> +static const struct file_operations ipsec_dbg_fops = {
> >> +	.owner = THIS_MODULE,
> >> +	.open = simple_open,
> >> +	.read = nsim_dbg_netdev_ops_read,
> >> +};
> >> +
> >> +/**
> >> + * nsim_ipsec_find_empty_idx - find the first unused security parameter index
> >> + * @ipsec: pointer to ipsec struct
> >> + **/
> >> +static int nsim_ipsec_find_empty_idx(struct nsim_ipsec *ipsec)
> >> +{
> >> +	u32 i;
> >> +
> >> +	if (ipsec->count == NSIM_IPSEC_MAX_SA_COUNT)
> >> +		return -ENOSPC;
> >> +
> >> +	/* search sa table */
> >> +	for (i = 0; i < NSIM_IPSEC_MAX_SA_COUNT; i++) {
> >> +		if (!ipsec->sa[i].used)
> >> +			return i;
> >> +	}
> >> +
> >> +	return -ENOSPC;  
> > 
> > FWIW I personally find bitmaps and find_first_zero_bit() etc. nice and
> > concise for a small ID allocator, but no objection to open coding.  
> 
> Sure, we could add a parallel bitmap data structure to track usage of 
> our array elements, and probably would for a much larger array so as to 
> lessen the impact of a serial search.  But, since this is a short array 
> for simple testing purposes, the search time is minimal so I think the 
> simple code is fine.

Ack, no objection.

> >   
> >> +	} else if (key_len == 128) {
> >> +		*mysalt = 0;
> >> +	} else {
> >> +		netdev_err(dev, "IPsec hw offload only supports 128 bit keys with optional 32 bit salt\n");
> >> +		return -EINVAL;
> >> +	}
> >> +	memcpy(mykey, key_data, 16);
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +/**
> >> + * nsim_ipsec_add_sa - program device with a security association
> >> + * @xs: pointer to transformer state struct
> >> + **/
> >> +static int nsim_ipsec_add_sa(struct xfrm_state *xs)
> >> +{
> >> +	struct net_device *dev = xs->xso.dev;
> >> +	struct netdevsim *ns = netdev_priv(dev);
> >> +	struct nsim_ipsec *ipsec = &ns->ipsec;  
> > 
> > xmas tree again (initialize out of line if you have to)  
> 
> This one is pretty much the way I've done in the past with no complaints 
> and seems common enough in other net drivers, specifically when dealing 
> with netdev and netdevpriv elements.  Only the first line is out of 
> place, with the next lines dependent on it.

I know, but I'd really prefer you just followed the rule here.

> >> diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/netdevsim.h
> >> index 3a8581a..1708dee 100644
> >> --- a/drivers/net/netdevsim/netdevsim.h
> >> +++ b/drivers/net/netdevsim/netdevsim.h
> >> @@ -29,6 +29,29 @@ struct bpf_prog;
> >>   struct dentry;
> >>   struct nsim_vf_config;
> >>   
> >> +#if IS_ENABLED(CONFIG_XFRM_OFFLOAD)
> >> +#define NSIM_IPSEC_MAX_SA_COUNT		33  
> > 
> > 33 caught my eye - out of curiosity is it 2^5 + 1 to catch some type of
> > bug or failure mode?  
> 
> For test rigs, I often use something like this to help flush out any 
> interesting power-of-two or alignment assumptions in the code.  I don't 
> expect anything here, but it doesn't hurt.

Cool, seems like a good idea anyway!

> >> +#define NSIM_IPSEC_VALID		BIT(31)
> >> +
> >> +struct nsim_sa {
> >> +	struct xfrm_state *xs;
> >> +	__be32 ipaddr[4];
> >> +	u32 key[4];
> >> +	u32 salt;
> >> +	bool used;
> >> +	bool crypt;
> >> +	bool rx;
> >> +};
> >> +
> >> +struct nsim_ipsec {
> >> +	struct nsim_sa sa[NSIM_IPSEC_MAX_SA_COUNT];
> >> +	struct dentry *pfile;
> >> +	u32 count;
> >> +	u32 tx;
> >> +	u32 ok;
> >> +};
> >> +#endif  
> > 
> > No need to wrap struct definitions in #if/#endif.  
> 
> I suppose this is a philosophical point... Since CONFIG_XFRM_OFFLOAD is 
> not yet a common config setting, I'd like to keep it here to not break 
> other folks' builds or dirty them up with unused struct definitions when 
> they aren't playing with IPsec offload anyway.

The fewer ifdefs in the code the better.  Both from pure LoC stand
point but also because someone may actually change things around
without having CONFIG_XFRM_OFFLOAD enabled and break *your*
configuration.  E.g. you are depending on indirect include of
net/xfrm.h, what if someone was to change headers around and broke that
implicit dependency?  The fewer ifdefs the better.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
