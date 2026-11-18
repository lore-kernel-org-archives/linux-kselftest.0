Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023648;
	b=zxGzOcj3g7BfEpcaont1Am1u+ni3kd1aLi4qeTQGq+yZJlcyme4eB+3pM8USM7mQjJig
	 8kl/hTIbzBIk1zcLVvhM0zq2AlpMQh+RG2Cazexdum9KJ0JJKPfWn9BTro8MykK9AnFzj
	 /iV6Vi8DZ8PtYnQ/3oiohvbaM1YG+JVZ6FXhWxMLw4El5QvJZ9kOzPXK1ERJeKUfIedA2
	 f3X8S+Xql4wTLP+HNKWqWu7Yu+QIgxzvhhmeizAxwlRngd7oSoju/Vd8/LCOG5ZQptp5X
	 /nLSSWmil8pEK2e9FIozctTju85UYAetYwW+iVikjUKcBVOA/WiKesGZj5jNJL8xVBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023648;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5cRfqj9rwLvlWPnslBSUJzLhvJtwkw2y+01PuwZctSY=;
	b=24t8ICqRJVqSId9SCQHnENof0/hEheszaG6MF2hp1VpFMF/pbc/VNIeDezTvaZMruCKP
	 Bqbo/re8usyfVC4JPgjadBfvU1VjgI46zHLmvqco9l4pUwstIB8Gu5ytm54moM12sWBl1
	 SesN26EWUzysCicFcbUJlWcH8dp+6EiVMpz3mXLDfZIvtyuqYnBnKpZ/6jaNtzKEyGVH2
	 UKhz7o6/EEQr25LcraXs0Bbyw+K5LGW/WKu/f/HltzzCys9efEWpgask69Mziq0fypd33
	 oj16L2IOHt9iK34R4QCiylp+PoVuJfI5AlEZJMEa/k+W3fNW6kORRhDNeXRj/WWKbXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=CvuHIUqb;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nbuU3HDq;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643B606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 17:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1643B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=CvuHIUqb;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=nbuU3HDq
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 3BDB1EC084F
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 12:40:46 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 18 Nov 2026 12:40:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795023646;
	 x=1795110046; bh=5cRfqj9rwLvlWPnslBSUJzLhvJtwkw2y+01PuwZctSY=; b=
	CvuHIUqbyg9MoyqLuax1jMcQ/y3qlCfFaltR9R019+6y9F0lpV/sTLNHsRUHkMH3
	lmfI7CSjpotWMPJuioFPoJc0dNXuif+0gIzL3qiC9Q0P7QxePepqhp1rVWV/1pu8
	7rRzsBV31N4HRGs5BM/S0emOssws5UBNFD/3yQaSalqm2bu5gd8JwLPwN8mNS6IS
	irfMtGDbR9WREoFVFPyRM+e9xxuHQChoJq/BNH5WeMXF5J0qMB7fStXJiw8e3VvG
	92Y2Dk2ND7ZdrrNgBcNICDPMyxv6PVvxRxwGh8PJ44/iGJhfrzR5QLE0oPnN4jui
	oOVhSfkA0k85O8FZ4HDlag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795023646; x=
	1795110046; bh=5cRfqj9rwLvlWPnslBSUJzLhvJtwkw2y+01PuwZctSY=; b=n
	buU3HDqJAmpj4lRq4Qt+tB8OBNRtU8Rfhu9sGx26qYSor5/b8y0vllKmKFAFlWll
	HJTn6kfPIqyKr260YIXUFMBzwGiZQta9r5SKya6TOT4aNviZYjl8O2E5luuMZl9p
	WRLmafF5aazINVNEZ9jLeb0ZADtq2iWR/YEhqT6ZbAlkwPMXM3CBNIIMdm8ALukb
	ZhEqoVkvmziBAGgdteVqYd9aHTkOo/dpnWOc6mDblTZtoMjxagg2PuE71jgEK7pG
	N9iFQHCOHz/QxLZJ6A1Pu276EQ2EUbyW7iJHNsTSZOMrLdsuRR8gr0apHoGNEkQO
	bXZ0eO3YJgCMkrobdZ1EA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795023646; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:F9zNW8i0ZwZNDSNbEr/H56jKYUfY4I9Gc1+DlUCsX8W46Qf
	WkCseSmQvA2XpNzgCUIRGS9ykVx7vng0pD/qx1F+ECComafpMvVsnwHzZkHyaqLF
	BkuYLQJF0MVXDug0FQMyTi0o1WDHIYnmZs+wlsEM1JkD6hBqfX+on6ANyFtGWa8N
	BHoRbFH6HGZujBRVuxV1l/Iu0jlMhXfoJXSm+Y+bzDDNzDB4ja+pJel3DHdGRZLf
	af4bgkjT9oFLS/M/mXSI2R1h7Bt/5mO13N+ayDVmaPrb0xHx2U39yOMa2GYCmIPx
	GevzfLKJIYtIX24FKiYpQZ4n3kve1dcEYrCu1sg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:7x0BXoWrWoPiMH6zo9k/16gLNR7JSBKOn4+ruCjS0S0=:HK3Zbkk/cm40pQ/j5YH634XGou+dnhzay9FnJUzLFxM=;
X-ME-Sender: <xms:HeP9alZ9u5sALox3LAL8zhPFmNfol2greDkLI72YnTFgi5o0AA0zfQ>
    <xme:HeP9aveiLBGQj0Jx94DiudXr058Ckv4nL45_dwDJgYRDnuCjSB8dZ6fGrIA-2Q4mH
    cf3dk8d_qTWDFMCxP1l31LAg80OmfRYQ5V-ymHziHWSd-oL5VnlHfo>
X-ME-Received: <xmr:HeP9aiklPTSOdsy8OVQis1a-sGdcIG8xUViow8k79rPH_muOKUv9UNLb-1XX7Ed9KxUmdQ-EkxcalFH5ta2x1MxhQXcDX5hCZ6N2HBS5H3kxDeOYjg>
X-ME-Proxy-Cause: dmFkZTGc6qrPaGfBN0K0zkB2QOgUCbSEdDg0QPPZDu1bNabI7cwlSnfcpVzpQXbv+JJWZX
    07PDLb0zV7B69Lm2bu1tOegMkY4kJK9LMAPd2KbhhEeZDL7DQwFQmIg64nxTrn1Mz+4ZxW
    wGE5Dl7y3/ZTU8tlaxsPMEFI403TEogv5QpGpy/J2dE1UGJdOXO4wtb9bKZtEyRCA2GUR0
    3O/BwQdxiFEgby4tkIyNI3LBsmxCBQZiN12aPxOxU0uwK9qXfNqCZ/2Um2rW5W2a2i23b8
    5uhFdl9D4T8RWIbYgT+gXPhWZrUXFiiJcpmDS9bnSzMnYySk+nDpHbDZSqf0ut9o34t/aG
    Q9AUyz1aDUxj8pNXMoE2tLGp22NRUGgbnarvJn+jjrI52FX++oRRF3+JkCnvxMZw436fND
    F3PwZEXLWQXJKVCpoKgDzAonCWw5LUSwKLBDnOI87XHmZFr6Omn7V7UTr715RBHgTbg2UM
    iYnw3VhbwygwYXbHpCLDyFuxkO5BPDqJSLQcnexiMpScDIAYkA8KIns55NPq3llBCLMIiL
    2le4CpOV0VqEKuzR5T9+jIj2aFamfADT7UgRCMSZui8FvRDTKNqiqrqttOhUPu1GFWUNmP
    8ceaIbwFmo4RF5yvYVSDmdIwx7uP2Ff6mcI7ki30lm4+/4YEOOBhKi3bBdCA
X-ME-Proxy: <xmx:HeP9av0fOtbWibGfGQQ8eV7m2HvWPixbQG8Wp92I95Go_aWXkpdhmQ>
    <xmx:HeP9ardVeeZ1dINk2pVxXW6gNDbqRkLCARJ35O9N9NhWMHNCSpxV7w>
    <xmx:HeP9apb50Z1GxvrX6_Uuf9c_R2F_3opn4FDxpQwEdluia4yLGCTKoQ>
    <xmx:HeP9agHLZowM7J39ffKXsVqr9MgVt-zuGgtAuxG3AegW0_X3BpJ1Yg>
    <xmx:HuP9agSagsrKbrxXXn8V7dfFGg6qQWHsxxLs5aYcA_LUqbSf_yF4Y93s>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 12:40:44 -0500 (EST)
Message-ID: <fa582b7f-23ba-449d-b311-20f6ac8e867c@bsbernd.com>
Date: Wed, 18 Nov 2026 18:40:42 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] fuse: add FUSE_OPEN_ATOMIC
To: Jimmy Zuber <jamz@amazon.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Jim Harris <jiharris@nvidia.com>,
 Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>,
 NeilBrown <neil@brown.name>, Joanne Koong <joannelkoong@gmail.com>
References: <20261110204421.1251726-1-jamz@amazon.com>
 <20261110204421.1251726-2-jamz@amazon.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20261110204421.1251726-2-jamz@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/10/26 21:44, Jimmy Zuber wrote:
> Add FUSE_OPEN_ATOMIC. FUSE_OPEN_ATOMIC is FUSE_LOOKUP plus FUSE_OPEN or
> FUSE_CREATE in one request. With FUSE_OPEN_ATOMIC, the kernel opens a
> name that is not in the dcache with one request to the server. This
> greatly improves performance for file systems where the bottleneck is
> calls between the kernel and the server. Servers that don't support
> FUSE_OPEN_ATOMIC are handled gracefully.
> 
> After a -ENOSYS reply to FUSE_OPEN_ATOMIC, every open() on the
> connection uses FUSE_LOOKUP, FUSE_OPEN and FUSE_CREATE, including the
> open() that received -ENOSYS.
> 
> The kernel sends FUSE_OPEN_ATOMIC from ->atomic_open(). The VFS calls
> ->atomic_open() for a name that is not in the dcache, and for open()
> with O_CREAT on a negative dentry. For a name with a valid positive
> dentry, the kernel sends FUSE_OPEN. FUSE_OPEN_ATOMIC for a name with a
> valid positive dentry would need a VFS change.
> 
> If the server opens an existing file, the VFS checks permissions after
> the reply, as on other filesystems with ->atomic_open(). If open() fails
> after a valid reply with fuse_open_out, the kernel sends FUSE_RELEASE.
> With default_permissions, the server can receive FUSE_OPEN_ATOMIC and
> FUSE_RELEASE for a file that the caller may not open.
> 
> The kernel clears O_TRUNC in fuse_create_in.flags, so that the server
> truncates a file only after the VFS checks permissions. After the VFS
> checks permissions, the kernel sends FUSE_SETATTR to truncate an
> existing file. A server with FUSE_ATOMIC_O_TRUNC truncates the file in
> FUSE_OPEN. For open() with O_TRUNC on a server with FUSE_ATOMIC_O_TRUNC,
> the kernel sends FUSE_OPEN or FUSE_CREATE after the VFS checks
> permissions, with FUSE_LOOKUP first for a name that is not in the
> dcache.
> 
> The request contains fuse_create_in and the name. The reply contains
> fuse_entry_out, and fuse_open_out if the server opened the file. The
> server replies as follows:
> 
> - O_CREAT | O_EXCL on an existing name: the server returns -EEXIST.
> - An existing regular file, with or without O_CREAT: the server can
>   open the file and return fuse_open_out. The server can also return
>   only fuse_entry_out, and the kernel sends FUSE_OPEN after the VFS
>   checks permissions.
> - An existing directory, symlink or special file: the server must
>   return only fuse_entry_out. The kernel returns -EIO for fuse_open_out
>   on any file except a regular file.
> - A missing name with O_CREAT: the server creates a regular file, opens
>   it, and sets FOPEN_CREATED.
> - A missing name without O_CREAT: the server returns a zero nodeid. The
>   kernel caches a negative dentry, as it does for FUSE_LOOKUP.
> 
> The server sets FOPEN_CREATED exactly when it created the file. For
> FOPEN_CREATED, the kernel sets FMODE_CREATED, and do_open() passes an
> acc_mode of 0 to may_open(), as for any file that open() creates.
> 
> For O_CREAT | O_EXCL, when the caller may not create the file, for
> example on a read-only mount, the VFS clears O_CREAT and leaves O_EXCL.
> For O_EXCL without O_CREAT, the kernel sends FUSE_LOOKUP. For an
> existing name, do_open() returns -EEXIST, and the server receives only
> FUSE_LOOKUP.
> 
> Signed-off-by: Jimmy Zuber <jamz@amazon.com>
> ---
>  fs/fuse/dir.c             | 194 ++++++++++++++++++++++++++++++++++++++
>  fs/fuse/fuse_i.h          |   6 ++
>  fs/fuse/fuse_trace.h      |   1 +
>  include/uapi/linux/fuse.h |  20 +++-
>  4 files changed, 220 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 8a8177a178a20..0331d4df6248e 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -938,6 +938,185 @@ static int fuse_create_open(const struct mnt_idmap *idmap, struct inode *dir,
>  	return err;
>  }
>  
> +/* Release the file the server opened for a reply the kernel rejects */
> +static void fuse_open_atomic_release(struct fuse_file *ff, u64 nodeid,
> +				     unsigned int open_size,
> +				     unsigned int flags)
> +{
> +	if (open_size >= FUSE_COMPAT_OPEN_OUT_SIZE && !invalid_nodeid(nodeid)) {
> +		ff->fh = ff->args->open_outarg.fh;
> +		ff->nodeid = nodeid;
> +		fuse_sync_release(NULL, ff, flags & ~(O_CREAT | O_EXCL));
> +	} else {
> +		fuse_file_free(ff);
> +	}
> +}
> +
> +/*
> + * Send FUSE_LOOKUP plus FUSE_OPEN or FUSE_CREATE as one FUSE_OPEN_ATOMIC
> + * request.  The server can open an existing regular file, or return only
> + * fuse_entry_out.  Without O_CREAT, a missing name gets a zero nodeid.
> + * The VFS checks permissions after the reply.  Returns 1 on -ENOSYS.
> + */
> +static int fuse_open_atomic(const struct mnt_idmap *idmap, struct inode *dir,
> +			    struct dentry *entry, struct file *file,
> +			    unsigned int flags, umode_t mode)
> +{
> +	struct fuse_mount *fm = get_fuse_mount(dir);
> +	struct fuse_conn *fc = fm->fc;
> +	FUSE_ARGS(args);
> +	struct fuse_forget_link *forget;
> +	struct fuse_create_in inarg;

Personally I'm not so happy about struct fuse_create_in. 

https://lore.kernel.org/all/20240813212149.1909627-1-joannelkoong@gmail.com/
https://lore.kernel.org/all/20240820211735.2098951-1-bschubert@ddn.com/


Summarized outcome from Miklos was that Miklos doesn't want to have another
op code for this combined operation and that Miklos would prefer a NFS like
compound way. Then Horst worked on compounds, with Miklos not wanting to
have that in fuse, but only in fusex. Well, the underlying problem doesn't
get solved - like there is a libfuse report with sshfs, where people set
a high attr timeout and then get corruption, because the file size is plain
wrong after open.


My suggestion would be to have a new atomic_open struct, similar to
fuse_create_in, but with flags. Given that atomic open is in the end
just an open+getattr, we could also use that for the issue above, with the
same new op code. However, we need Miklos' agreement here. 

We happen to have an online meeting once per month and the next is tomorrow,
would you mind to join?


> +	struct fuse_open_out *outopen;
> +	struct fuse_entry_out outentry;
> +	struct inode *inode = NULL;
> +	unsigned int open_size;
> +	u64 attr_version, evict_ctr;
> +	struct fuse_file *ff;
> +	struct dentry *res;
> +	bool locked = false;
> +	int epoch, err;
> +
> +	if (entry->d_name.len > fc->name_max)
> +		return -ENAMETOOLONG;
> +	forget = fuse_alloc_forget();
> +	ff = fuse_file_alloc(fm, true);
> +	if (!forget || !ff) {
> +		kfree(forget);
> +		if (ff)
> +			fuse_file_free(ff);
> +		return -ENOMEM;
> +	}
> +	outopen = &ff->args->open_outarg;
> +	if (!fc->dont_mask)
> +		mode &= ~current_umask();
> +
> +	/* The VFS truncates after may_open() */
> +	memset(&inarg, 0, sizeof(inarg));
> +	memset(&outentry, 0, sizeof(outentry));
> +	inarg.flags = flags & ~(O_NOCTTY | O_TRUNC);
> +	inarg.mode = mode;
> +	inarg.umask = current_umask();
> +	args.opcode = FUSE_OPEN_ATOMIC;
> +	args.nodeid = get_node_id(dir);
> +	args.in_numargs = 2;
> +	args.in_args[0].size = sizeof(inarg);
> +	args.in_args[0].value = &inarg;
> +	args.in_args[1].size = entry->d_name.len + 1;
> +	args.in_args[1].value = entry->d_name.name;
> +	args.out_numargs = 2;
> +	args.out_args[0].size = sizeof(outentry);
> +	args.out_args[0].value = &outentry;
> +	args.out_argvar = true;
> +	args.out_args[1].size = sizeof(*outopen);
> +	args.out_args[1].value = outopen;
> +
> +	if (flags & O_CREAT) {
> +		err = get_create_ext(idmap, &args, dir, entry, mode);
> +		if (err)
> +			goto out_free;
> +	} else {
> +		/* Locked as for FUSE_LOOKUP */
> +		idmap = &invalid_mnt_idmap;
> +		locked = fuse_lock_inode(dir);
> +	}
> +	epoch = atomic_read(&fc->epoch);
> +	attr_version = fuse_get_attr_version(fc);
> +	evict_ctr = fuse_get_evict_ctr(fc);
> +	err = fuse_simple_idmap_request(idmap, fm, &args);
> +	fuse_unlock_inode(dir, locked);
> +	free_ext_value(&args);
> +	if (err < 0) {
> +		if (err == -ENOSYS) {
> +			fc->no_open_atomic = 1;
> +			err = 1;
> +		} else if (err == -EEXIST) {
> +			fuse_invalidate_entry(entry);
> +		}
> +		goto out_free;
> +	}
> +
> +	open_size = args.out_args[1].size;
> +	if (open_size && (outopen->open_flags & FOPEN_CREATED))
> +		fuse_dir_changed(dir);
> +	err = -EIO;
> +	if (outentry.nodeid && (invalid_nodeid(outentry.nodeid) ||
> +				fuse_invalid_attr(&outentry.attr)))
> +		goto out_reject;
> +	/* A zero nodeid: the name does not exist and nothing was opened */
> +	if (!outentry.nodeid && (open_size || (flags & O_CREAT)))
> +		goto out_reject;
> +	/* Only a regular file is opened */
> +	if (open_size && (open_size < FUSE_COMPAT_OPEN_OUT_SIZE ||
> +			  !S_ISREG(outentry.attr.mode)))
> +		goto out_reject;
> +	if (outentry.nodeid) {
> +		inode = fuse_iget(dir->i_sb, outentry.nodeid,
> +				  outentry.generation, &outentry.attr,
> +				  ATTR_TIMEOUT(&outentry), attr_version,
> +				  evict_ctr);
> +		err = -ENOMEM;
> +		if (!inode)
> +			goto out_reject;
> +		fuse_advise_use_readdirplus(dir);
> +	}
> +	kfree(forget);
> +
> +	if (!open_size) {
> +		fuse_file_free(ff);
> +		res = d_splice_alias(inode, entry);
> +		if (!IS_ERR(res)) {
> +			fuse_dentry_set_epoch(res ?: entry, epoch);
> +			fuse_change_entry_timeout(res ?: entry, &outentry);
> +		}
> +		return finish_no_open(file, res);
> +	}
> +
> +	if (fuse_is_bad(inode)) {
> +		fuse_open_atomic_release(ff, outentry.nodeid, open_size,
> +					 inarg.flags);
> +		iput(inode);
> +		return -EIO;
> +	}
> +	if ((flags & O_CREAT) && (outopen->open_flags & FOPEN_CREATED))
> +		file->f_mode |= FMODE_CREATED;
> +	ff->fh = outopen->fh;
> +	ff->nodeid = outentry.nodeid;
> +	ff->open_flags = outopen->open_flags & ~FOPEN_CREATED;
> +	d_splice_alias(inode, entry);
> +	fuse_dentry_set_epoch(entry, epoch);
> +	fuse_change_entry_timeout(entry, &outentry);
> +
> +	err = generic_file_open(inode, file);
> +	if (!err) {
> +		file->private_data = ff;
> +		err = finish_open(file, entry, fuse_finish_open);
> +	}
> +	if (err) {
> +		/* fput() releases a file that finish_open() opened */
> +		if (!(file->f_mode & FMODE_OPENED))
> +			fuse_sync_release(get_fuse_inode(inode), ff,
> +					  inarg.flags & ~(O_CREAT | O_EXCL));
> +	} else if (!(ff->open_flags & FOPEN_KEEP_CACHE) && !IS_DAX(inode)) {
> +		invalidate_inode_pages2(inode->i_mapping);
> +	}
> +	return err;
> +
> +out_reject:
> +	fuse_open_atomic_release(ff, outentry.nodeid, open_size,
> +				 inarg.flags);
> +	if (!invalid_nodeid(outentry.nodeid))
> +		fuse_chan_queue_forget(fc->chan, forget, outentry.nodeid, 1);
> +	else
> +		kfree(forget);
> +	return err;
> +
> +out_free:
> +	fuse_file_free(ff);
> +	kfree(forget);
> +	return err;
> +}
> +
>  static int fuse_mknod(const struct mnt_idmap *, struct inode *, struct dentry *,
>  		      umode_t, dev_t);
>  static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
> @@ -951,6 +1130,21 @@ static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
>  	if (fuse_is_bad(dir))
>  		return -EIO;
>  
> +	/*
> +	 * With atomic_o_trunc, FUSE_OPEN truncates after a FUSE_LOOKUP.  O_EXCL
> +	 * without O_CREAT can mean the VFS cleared O_CREAT: with FUSE_LOOKUP,
> +	 * do_open() fails with -EEXIST and the server sees only FUSE_LOOKUP.
> +	 */
> +	if (!fc->no_open_atomic &&
> +	    !((file->f_flags & O_TRUNC) && fc->atomic_o_trunc) &&
> +	    ((flags & O_CREAT) ||
> +	     (d_in_lookup(entry) && !(flags & (O_EXCL | O_DIRECTORY))))) {
> +		err = fuse_open_atomic(idmap, dir, entry, file, flags,
> +				       mode | S_IFREG);
> +		if (err <= 0)
> +			return err;
> +	}

This works, but is hard to read, in my opinion. How about


if (fuse_use_open_atomic(fc, entry, file, flags)) {
       err = fuse_open_atomic(idmap, dir, entry, file, flags,
                              mode | S_IFREG);
       if (err <= 0)
              return err;

with 


static bool fuse_use_open_atomic(struct fuse_conn *fc, struct dentry *entry,
                                 struct file *file, unsigned int flags)
{
        if (fc->no_open_atomic)
                return false;

        /* With atomic_o_trunc, only FUSE_OPEN truncates, after may_open() */
        if ((file->f_flags & O_TRUNC) && fc->atomic_o_trunc)
                return false;

        if (flags & O_CREAT)
                return true;

        /* Without O_CREAT, FUSE_OPEN_ATOMIC replaces a FUSE_LOOKUP */
        if (!d_in_lookup(entry))
                return false;

        /*
         * O_EXCL without O_CREAT can mean the VFS cleared O_CREAT: with
         * FUSE_LOOKUP, do_open() fails with -EEXIST and the server sees only
         * FUSE_LOOKUP.
         */
        if (flags & O_EXCL)
                return false;

        /* The server does not open a directory in FUSE_OPEN_ATOMIC */
        return !(flags & O_DIRECTORY);
}

Let's discuss truncate, I guess it could truncate directly
in atomic open when fc->default_permissions is not set?


Then 

>        /* Without O_CREAT, FUSE_OPEN_ATOMIC replaces a FUSE_LOOKUP */


maybe

       /* Without O_CREAT, a dentry not in lookup is a valid negative dentry */


>        /* The server does not open a directory in FUSE_OPEN_ATOMIC */
>        return !(flags & O_DIRECTORY);

For high level with nfs style renames for open-unlink we should actually better
open, but that is not directly related.

> +
>  	if (d_in_lookup(entry)) {
>  		struct dentry *res = fuse_lookup(dir, entry, 0);
>  		if (res || d_really_is_positive(entry))
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index a033b0bc45762..05c2da7f86670 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -50,6 +50,9 @@
>  /** Number of dentries for each connection in the control filesystem */
>  #define FUSE_CTL_NUM_DENTRIES 5
>  
> +/** Size of fuse_open_out without backing_id_64 */
> +#define FUSE_COMPAT_OPEN_OUT_SIZE offsetofend(struct fuse_open_out, backing_id)
> +
>  /*
>   * Dentries invalidation workqueue period, in seconds.  The value of this
>   * parameter shall be >= FUSE_DENTRY_INVAL_FREQ_MIN seconds, or 0 (zero), in
> @@ -618,6 +621,9 @@ struct fuse_conn {
>  	/** @no_create: Is create not implemented by fs? */
>  	unsigned no_create:1;
>  
> +	/** @no_open_atomic: Is FUSE_OPEN_ATOMIC not implemented by fs? */
> +	unsigned no_open_atomic:1;
> +
>  	/** @no_bmap: Is bmap not implemented by fs? */
>  	unsigned no_bmap:1;
>  
> diff --git a/fs/fuse/fuse_trace.h b/fs/fuse/fuse_trace.h
> index 60baa10bbcb99..54d7a1891c382 100644
> --- a/fs/fuse/fuse_trace.h
> +++ b/fs/fuse/fuse_trace.h
> @@ -58,6 +58,7 @@
>  	EM( FUSE_SYNCFS,		"FUSE_SYNCFS")		\
>  	EM( FUSE_TMPFILE,		"FUSE_TMPFILE")		\
>  	EM( FUSE_STATX,			"FUSE_STATX")		\
> +	EM( FUSE_OPEN_ATOMIC,		"FUSE_OPEN_ATOMIC")	\
>  	EMe(CUSE_INIT,			"CUSE_INIT")
>  
>  /*
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 616430a2973c6..ae9b051c1cd80 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -257,6 +257,9 @@
>   *  - add backing_id_64 to fuse_open_out
>   *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_extent
>   *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
> + *
> + *  7.48
> + *  - add FUSE_OPEN_ATOMIC and FOPEN_CREATED
>   */
>  
>  #ifndef _LINUX_FUSE_H
> @@ -292,7 +295,7 @@
>  #define FUSE_KERNEL_VERSION 7
>  
>  /** Minor version number of this interface */
> -#define FUSE_KERNEL_MINOR_VERSION 47
> +#define FUSE_KERNEL_MINOR_VERSION 48
>  
>  /** The node ID of the root inode */
>  #define FUSE_ROOT_ID 1
> @@ -406,6 +409,7 @@ struct fuse_file_lock {
>   *                           (FUSE_URING_ZERO_COPY) and the request carries page
>   *                           payload. Otherwise reads/writes fall back to
>   *                           copying.
> + * FOPEN_CREATED: the server created the file for FUSE_OPEN_ATOMIC
>   */
>  #define FOPEN_DIRECT_IO		(1 << 0)
>  #define FOPEN_KEEP_CACHE	(1 << 1)
> @@ -416,6 +420,7 @@ struct fuse_file_lock {
>  #define FOPEN_PARALLEL_DIRECT_WRITES	(1 << 6)
>  #define FOPEN_PASSTHROUGH	(1 << 7)
>  #define FOPEN_IO_URING_ZERO_COPY (1 << 8)
> +#define FOPEN_CREATED		(1 << 9)
>  
>  /*
>   * INIT request/reply flags
> @@ -699,6 +704,19 @@ enum fuse_opcode {
>  	FUSE_STATX		= 52,
>  	FUSE_COPY_FILE_RANGE_64	= 53,
>  
> +	/*
> +	 * FUSE_OPEN_ATOMIC is FUSE_LOOKUP plus FUSE_OPEN or FUSE_CREATE in one
> +	 * request. The request is fuse_create_in, with O_TRUNC cleared, and the
> +	 * name. The reply is fuse_entry_out, plus fuse_open_out if the server
> +	 * opened the file. The server can open an existing regular file, and no
> +	 * other file type. With O_CREAT, the server creates and opens a regular
> +	 * file for a missing name and sets FOPEN_CREATED; an existing name with
> +	 * O_EXCL gets -EEXIST. Without O_CREAT, a missing name gets a zero
> +	 * nodeid. If open() fails after a valid reply with fuse_open_out, the
> +	 * kernel sends FUSE_RELEASE.
> +	 */
> +	FUSE_OPEN_ATOMIC	= 54,
> +
>  	/* CUSE specific operations */
>  	CUSE_INIT		= 4096,
>  


I will continue digging later on.


Thanks,
Bernd
