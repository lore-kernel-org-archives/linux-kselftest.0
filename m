Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA7536F8F0;
	Sat, 10 Oct 2026 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627665; cv=none; b=HFpS2rhvidr0arBX2JslgUIEEAIthIc3CSup5IxtCumvuQLxvLGNAlvvTVsuc3sHh+WVY65JNjtvcTtubasG7Ud0e48Mg1UarqtY9SZ5nEYdbxocrwoJDRax/2XMU394bU6oNGovrjN2+e9Z9D2FCdcA143E6IXe63+L82IrXrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627665; c=relaxed/simple;
	bh=eD4Zcwx2XKMocqxB6g9BVwV3EdemU3hTFb9LHqDyByc=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZctVU1BHsb2iE5MmzMeHp/CZJW99uTrijFUSd5rE/413Qg8LSEFc8pwKM7Lnv+opH2k8D76chxYQAPqSyJ1NLy4LDvqwiG8RjTvv8c+K9irWwHHHlwBFldeYtY4tluWSYA+6M5KQ6ZOUx72yCQOsdvyqv+VRdjJyuaIdzxvHY44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLhRCRnr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLhRCRnr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AB051F000FF;
	Sat, 10 Oct 2026 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791627663;
	bh=eX49ecnK1yX0oQBGYjqLmGFhTNizuDshcWBPiQNkZQU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PLhRCRnrIngq166grwddtQHIq+eI877lyBC0oKn1Ex02MNNAQHFvBq3o4zXYpP9HH
	 LcDeDSca9dpJ4KpF9GMKpvazDJ8SoMubbQ35UbQ/cZq7/4zm+RGE6/A93nfjNRCom4
	 g7Fx80AIGgrWnHhhAxYItgRdf80/Tph08WrvWJ1wUg23jD2REUCcSvAoJ5SkyeWbU2
	 ICfm9e17ANXlXVewnJHzzbt/enFygFNHGnNbZZt6XNpATvLZdDPgJoqUae+4+c4gHo
	 xR5DsN7hRYjATgEqh8DMspJQRxQAj6BPJt82VEm13hB1phsTxC/DLb0bZQpVDPJoUD
	 3btFfUps+kIqA==
Subject:
 Re: [PATCH net-next v2 2/5] seg6: add RFC8986 flavor support for End.X
From: netdev-bot+sashiko@kernel.org
To: hangbin.liu@linux.dev
Cc: andrea.mayer@uniroma2.it, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, liuhangbin@kylinos.cn
Date: Sat, 10 Oct 2026 10:21:02 +0000
Message-ID: <179162766256.434549.13511080924871737471@kernel.org>
In-Reply-To: <20261009-srv6_flavors_endx-v2-2-56ac7f838f41@kylinos.cn>
References: <20261009-srv6_flavors_endx-v2-2-56ac7f838f41@kylinos.cn>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] End.X now accepts the flavor pair NEXT-C-SID + PSP but only
  applies NEXT-C-SID.

--

seg6: add RFC8986 flavor support for End.X

This patch adds PSP flavor processing to the SRv6 End.X behavior by reusing
end_flv8986_core(). It also widens SEG6_LOCAL_END_X_FLV_SUPP_OPS so that
End.X advertises PSP support alongside NEXT-C-SID.

> diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
> index 4fcfcd48cfaed..521a9b0c09290 100644
> --- a/net/ipv6/seg6_local.c
> +++ b/net/ipv6/seg6_local.c
> @@ -121,7 +121,8 @@ struct bpf_lwt_prog {
>  
>  #define SEG6_LOCAL_END_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
>  					 SEG6_LOCAL_FLV8986_SUPP_OPS)
> -#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	SEG6_F_LOCAL_FLV_NEXT_CSID
> +#define SEG6_LOCAL_END_X_FLV_SUPP_OPS	(SEG6_F_LOCAL_FLV_NEXT_CSID | \
> +					 SEG6_LOCAL_FLV8986_SUPP_OPS)
>  
>  struct seg6_flavors_info {
>  	/* Flavor operations */

[ ... ]

> @@ -923,12 +924,20 @@ static int input_action_end_x(struct sk_buff *skb, struct seg6_local_lwt *slwt)
>  {
>  	const struct seg6_flavors_info *finfo = &slwt->flv_info;
>  	__u32 fops = finfo->flv_ops;
> +	int ret;
> +
> +	if (!fops)
> +		return input_action_end_x_core(skb, slwt);
>  
>  	/* check for the presence of NEXT-C-SID since it applies first */
>  	if (seg6_next_csid_enabled(fops))
>  		return end_x_next_csid_core(skb, slwt);

[Severity: Medium]
Now that SEG6_LOCAL_END_X_FLV_SUPP_OPS is wider, what happens when an
End.X instance is configured with both next-csid and psp?

parse_nla_flavors() only rejects bits that fall outside the supported mask:

net/ipv6/seg6_local.c:parse_nla_flavors() {
    ...
	if (rc < 0 || (fops & ~supp_fops)) {
		NL_SET_ERR_MSG(extack, "Unsupported Flavor operation(s)");
		return -EOPNOTSUPP;
	}
    ...
}

So NEXT_CSID|PSP is now accepted for SEG6_LOCAL_ACTION_END_X. It gets
stored in flv_ops and reported back to userspace as configured.

On the data path, input_action_end_x() returns through the NEXT-C-SID
branch above and never reaches end_flv8986_core(). Once the C-SID argument
is used up, end_x_next_csid_core() falls back to plain End.X processing:

net/ipv6/seg6_local.c:end_x_next_csid_core() {
    ...
	if (seg6_next_csid_is_arg_zero(daddr, finfo))
		return input_action_end_x_core(skb, slwt);
    ...
}

input_action_end_x_core() only calls advance_nextseg() and then
input_action_end_x_finish(). It never calls seg6_pop_srh(), even when
SL == 1.

Does that mean the configured psp flavor is silently ignored, and packets
leave with the SRH still attached? A downstream node with seg6_enabled=0
would then drop them, and nothing reports an error at configuration time.

This also seems to contradict the comment above
seg6_flv_supp_ops_by_action():

 * ... if a user specifies a
 * flavor combination that is not supported by a given End* behavior, the
 * kernel refuses to instantiate the tunnel reporting the error.

Before this patch, End.X refused psp entirely. End already has the same
mismatch in input_action_end(); this patch carries it over to End.X.

The note below the --- line says this combination is not handled and that
Andrea is preparing a fix. That note won't be in the commit log, though.
Nothing in the code or the commit message rejects or documents the
combination, and net/ipv6/seg6_local.c is not changed again after this
patch.

Could parse_nla_flavors() reject NEXT_CSID combined with any RFC8986
flavor? Or could the End.X mask stay at SEG6_F_LOCAL_FLV_NEXT_CSID until
combined processing is in place?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009-srv6_flavors_endx-v2-0-56ac7f838f41%40kylinos.cn
