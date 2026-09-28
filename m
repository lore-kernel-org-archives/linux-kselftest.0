Received: from mta1.migadu.com (out-230.mta1.migadu.com [95.215.58.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8253315D32
	for <linux-kselftest@vger.kernel.org>; Mon, 28 Sep 2026 06:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790576525; cv=none; b=Z5wUJ1jeDkgFJwTBVz1PyFb1Kg5X6pyRkFsu5OBZYGcULpFR2eTkI/vtc7xO/z6MdA5O/TpNBfvPYC9u254sYCqeZJjkzIWrELeCmxe3B72F4VrFYyeEZsGZ11226so/Sv50JAcTQuZ4p1m5FxX79/rzDXKxUgWH28fVv0h3/wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790576525; c=relaxed/simple;
	bh=xym6Wj7a/N3u6kYO3/JK3RDdgZcFhCBlwPnIf4E3wOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4lVWeax2LWnGPFHiSTAnuBaGCsfZCVoTkWj0NzzYDdFyTe+GIyh9cmn9vQvCJkT6+/gRTQ9JHpFBFLxXM5FWwDhy50TS5B6z4dGacSB9vD6qTHV0uAmunmb2lDwUvAAXxnu6DhOuJNqt73FYg/K4a4C7IEo1mj5wxEDC9vscHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=VFvnTRfJ; arc=none smtp.client-ip=95.215.58.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="VFvnTRfJ"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=xym6Wj7a/N3u6kYO3/JK3RDdgZcFhCBlwPnIf4E3wOM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790576520; v=1; x=1791181320;
 b=VFvnTRfJFFAZonTkx+Um9XdugatgKpaamU4hx5IBOJSqOlDX7s64g4SPVKWgO+AvUE2UWnLe
 XICLuCqXU5cZL8ZKTTS+KSXaAgBJoSsubyF5Y7VOi3rSUde7wiMrLuI5uDDxkt5xv0UweCKB7pE
 AER1vc1Ph58gWa26+56teTcg=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id b52d0056da5ef9c5;
	Mon, 28 Sep 2026 06:22:00 +0000
X-Mizu-Trace-ID: b52d0056da5ef9c5
X-Migadu-Flow: FLOW_OUT
Date: Mon, 28 Sep 2026 14:21:48 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: netdev-bot+sashiko@kernel.org
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	shuah@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	liuhangbin@kylinos.cn
Subject: Re: [PATCH net-next 2/5] seg6: add RFC8986 flavor support for End.X
Message-ID: <aroHfO-QWHwm5e19@fedora>
References: <20260922-srv6_flavors_endx-v1-2-4d01c05c47b7@kylinos.cn>
 <179025107692.2160803.16596847240332091038@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179025107692.2160803.16596847240332091038@kernel.org>

Hi,
On Thu, Sep 24, 2026 at 11:57:56AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 1
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] net/ipv6/seg6_local.c: the patch widens
>   SEG6_LOCAL_END_X_FLV_SUPP_OPS to (SEG6_F_LOCAL_FLV_NEXT_CSID |…

Andrea has talked about this issue and will fix it in net tree.

> - [Low] net/ipv6/seg6_local.c:759-761 — the kerneldoc-style comment on
>   end_flv8986_core() still says the helper processes the packet "on the…

OK, I will update the comment.

Thanks
Hangbin
> 
> --
> 
> seg6: add RFC8986 flavor support for End.X
> 
> This adds PSP processing to the SRv6 End.X behavior by reusing
> end_flv8986_core(), and widens SEG6_LOCAL_END_X_FLV_SUPP_OPS so End.X
> advertises PSP flavor support alongside NEXT-C-SID.
> 
> > diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> > index 584e6aca38930..7462da1da3629 100644
> > --- a/net/ipv6/seg6_local.c
> > +++ b/net/ipv6/seg6_local.c
> > @@ -121,7 +121,8 @@ struct bpf_lwt_prog {
> >  
> >  #define SEG6_LOCAL_END_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
> >  					 SEG6_LOCAL_FLV8986_SUPP_OPS)
> > -#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	SEG6_F_LOCAL_FLV_NEXT_CSID
> > +#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
> > +					 SEG6_LOCAL_FLV8986_SUPP_OPS)
> 
> [Severity: Medium]
> With this mask widened, does parse_nla_flavors() now accept the
> combination next-csid plus psp for an End.X instance?
> 
> parse_nla_flavors() only rejects bits outside the per-action mask:
> 
> 	rc = seg6_flv_supp_ops_by_action(action, &supp_fops);
> 	if (rc < 0 || (fops & ~supp_fops)) {
> 		NL_SET_ERR_MSG(extack, "Unsupported Flavor operation(s)");
> 		return -EOPNOTSUPP;
> 	}
> 
> 	finfo->flv_ops = fops;
> 
> and seg6_flv_supp_ops_by_action() returns SEG6_LOCAL_END_X_FLV_SUPP_OPS for
> SEG6_LOCAL_ACTION_END_X, so "ip route ... action End.X nh6 <addr> oif <dev>
> flavors next-csid,psp" would be installed, and put_nla_flavors() echoes the
> stored mask including PSP back to user space.
> 
> Is PSP actually executed in that configuration?  In the new
> input_action_end_x() below, the NEXT-C-SID test returns before
> end_flv8986_core() is reached, and the arg-zero sub-case of
> end_x_next_csid_core() goes to input_action_end_x_core():
> 
> 	if (seg6_next_csid_is_arg_zero(daddr, finfo))
> 		return input_action_end_x_core(skb, slwt);
> 
> input_action_end_x_core() only does advance_nextseg() and then
> input_action_end_x_finish(), so seg6_pop_srh() is never called and the SRH
> stays on the packet even though PSP was accepted and is reported as
> configured.  The comment above seg6_flv_supp_ops_by_action() states that
> unsupported combinations make the kernel refuse to instantiate the tunnel.
> 
> Would it be better to reject next-csid together with psp for End.X in
> parse_nla_flavors(), or to route the NEXT-C-SID arg-exhausted path into
> end_flv8986_core()?
> 
> For reference, the same shape already exists for the End action via
> SEG6_LOCAL_END_FLV_SUPP_OPS and input_action_end()/end_next_csid_core(),
> but for End.X the combination only becomes configurable with this change.
> At the end of the series the mask and input_action_end_x() are unchanged,
> and the added selftest only installs psp on its own, so the combination
> stays accepted but unimplemented.
> 
> >  
> >  struct seg6_flavors_info {
> >  	/* Flavor operations */
> > @@ -841,12 +842,19 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
> >  {
> >  	const struct seg6_flavors_info *finfo = &slwt->flv_info;
> >  	__u32 fops = finfo->flv_ops;
> > +	int ret;
> > +
> > +	if (!fops)
> > +		return input_action_end_x_core(skb, slwt);
> >  
> >  	/* check for the presence of NEXT-C-SID since it applies first */
> >  	if (seg6_next_csid_enabled(fops))
> >  		return end_x_next_csid_core(skb, slwt);
> >  
> > -	return input_action_end_x_core(skb, slwt);
> > +	ret = end_flv8986_core(skb, slwt);
> > +	if (ret)
> > +		return ret;
> > +	return input_action_end_x_finish(skb, slwt);
> >  }
> 
> [Severity: Low]
> This isn't a bug, but the comment above end_flv8986_core() still reads:
> 
> 	/* process the packet on the basis of the RFC8986 flavors set for the given
> 	 * SRv6 End behavior instance.
> 	 */
> 
> With this new call site the helper also serves End.X, whose post-processing
> differs (input_action_end_x_finish() forwards to slwt->nh6/slwt->oif rather
> than doing a DA-based lookup).  Could the comment say "End* behavior", which
> is the wording already used above seg6_flv_supp_ops_by_action() and in the
> SEG6_F_LOCAL_FLAVORS comment?
> 
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260922-srv6_flavors_endx-v1-0-4d01c05c47b7%40kylinos.cn
