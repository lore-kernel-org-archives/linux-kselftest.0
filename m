Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD913C2761;
	Tue,  2 Jun 2026 08:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388031; cv=none; b=fXYyfHz3gZiMEXQDbxCwrOeI6M0SXkKS71runpOt9QDx+ZZ41MPwk6syOeGwNKMrXnTasJr8WC024LDksHhpc6UxtoBdmDM0UMHhN+8oJCaXu1U96CBGmVn436ss0AZPwGBPreG/iRnqmStzD8uV05+JhkgMUkHx6BMJOZE/FoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388031; c=relaxed/simple;
	bh=PFbs6pHoCpHX3NDqMcTbSVg2XRfbstDsHiva1+jHmsY=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=IHw18MKolGoUqzaquySkTV14THobbVGTE6MBlDoqYkaUoH+GfalD/hw74Zyx4rphXq+OBdUZ9OpV4dt4y75vs4bWzMwOzf2Xs7RE/xLFae2/HPQZcYj08Aj2wl6ny9FKOoFEWDhV4y9ZtI1BOpidiAaSyRYELSXwDaT0q0cT+zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BKXzTPVe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BKXzTPVe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856151F00893;
	Tue,  2 Jun 2026 08:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780388029;
	bh=9masuDvZGRAE5YhO0nxFypjCa/sv5HXBG/vt0WeBSHY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BKXzTPVeNI3EzsZztLA+Etdw4lE1OGP7XkpvZ37eeDEGaDydQwyq9IugNdZBmAYvs
	 FnqxLdkt/2eygj2ytRe1nnhKx+iBbgy9pHJ0KDBfSNyODINtGD+F1dpz5xpaS4QY70
	 dzhesbOX4O+UE04WBYEPnUNMMhUfwjmCBQvOBV++UUSG9fn57/q+2X1iZUv3GtfKzS
	 Cm7GMdTCvrapPt8AGMxEExKMmU4sl/gawXrebtYxnhRpE/TeHiZ+jxfXv9ny1a3v8S
	 6nFXBkwl0eHnofOmZYQ64h4A+zO0Mdu8DNmWNYP6M03PUMobTq2oOtcAlkY+j4vc2V
	 If0s6C+uH6NbQ==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 03/13] liveupdate: centralize state management into
 struct luo_ser
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
 akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
 dmatlack@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
 skhawaja@google.com, graf@amazon.com
In-Reply-To: <20260530221938.115978-4-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-4-pasha.tatashin@soleen.com>
Date: Tue, 02 Jun 2026 11:13:34 +0300
Message-Id: <178038801487.119771.6308607614059754603.b4-review@b4>
X-Mailer: b4 0.15.2

On Sat, 30 May 2026 22:19:28 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> diff --git a/kernel/liveupdate/luo_flb.c b/kernel/liveupdate/luo_flb.c
> index 8f5c5dd01cd0..c8dd30b41238 100644
> --- a/kernel/liveupdate/luo_flb.c
> +++ b/kernel/liveupdate/luo_flb.c
> @@ -579,53 +565,18 @@ int __init luo_flb_setup_outgoing(void *fdt_out)
> [ ... skip 18 lines ... ]
> -	offset = fdt_subnode_offset(fdt_in, 0, LUO_FDT_FLB_NODE_NAME);
> -	if (offset < 0) {
> -		pr_err("Unable to get FLB node [%s]\n", LUO_FDT_FLB_NODE_NAME);
> -
> -		return -ENOENT;
> +	if (flbs_pa) {

I like 

	if (!flbs_pa)
		return;

more

>
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> index 8d9201c25412..3b760fefa7b9 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -497,75 +494,34 @@ int luo_session_retrieve(const char *name, struct file **filep)
> [ ... skip 58 lines ... ]
> +	if (sessions_pa) {
> +		header_ser = phys_to_virt(sessions_pa);
> +		luo_session_global.incoming.header_ser = header_ser;
> +		luo_session_global.incoming.ser = (void *)(header_ser + 1);
> +		luo_session_global.incoming.active = true;
>  	}

Ditto

-- 
Sincerely yours,
Mike.

