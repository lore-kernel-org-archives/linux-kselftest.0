Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324384;
	b=WJaU4ANmhAAltVh9w4nvupM74TQcEzu61dlynYeRUjx7fHWW+gfIcjI8DW7bRn0aR8OW
	 ZgrN0Z21fv9Ab4YQ5KtA+5G8O6caOgt016q5l7zT4/1XtmLqPITDHCvBzJBeCz6KMnCZe
	 gNiMGNo1ERMaNiSASxKolBuVE9wt+F6u8Chpx4X6NiASlQ02dNG2zuon0mdSOL3DYTMOp
	 +lLTPmilSApxqjEPsJiP73qZik5xbZDedPUCny5nIYJBERshjuixJUnbd56WygJBRw+W0
	 gXF1g8go8R7VZ4yGr17GIg7AZ/A1sKw8VxHj9UyOekdJHuDvS1Duf/DzdW89H/UWIcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324384;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=wQV6hKwuFgiTM0haeZ8VIQuyAs/x1uTfCdWmXgdPkls=;
	b=wPW1OEKC1XMcyq7S25HtV7LCNFQ2FZNzNd6if68cYLVPNGKMh6jtdis5AlaXEZZtCTah
	 VeCzJKu7OB9ycSPTqjdQ0qfCUvURHCxYZRzVxIc16U13YxlzEXlRzPjAWWcBUqJP9Vynf
	 cqh/zJdrVAcBeVUWLZiGlL/sZjU5eZfIPnf61NA+knzYx12RxxTK0PlaCgLRG1rE7AMIV
	 0YNYGerRImBzwp5Suj3o09fnCmn8ZbWe5IVhajOFTU4cM7dxxK/imaujRXt4jyN5/nVbQ
	 lSkhHHKMxT7e/hm3fVnah5rmun4Ux13lMtrt00abaZPwrsxLFWsedITae4kSflZLURA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=EZ1HyjW7;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZizBHv2R;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC11606A31C
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 01:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBC11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=EZ1HyjW7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ZizBHv2R
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0F89114000F4
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 21:39:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 29 Oct 2026 21:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1793324383; x=1793410783; bh=wQV6hKwuFgiTM0haeZ8VIQuyAs/x1uTfCdW
	mXgdPkls=; b=EZ1HyjW7wL+4fy2+7b62aQpj9gQK1N0kGigjU+To3j4cWGXbsB+
	OYyyzI63vIrYrN8TQlP9WUO4k7qUdBCclRPrgO7uhRho4OuorTpFwcPOiLus8A6C
	ag1IPyhEeDA2qIfP1BGpeHhMwiL00fCqMd9+n5aHe7+LIltyf+8ehnPFGhL08stg
	uBebcrL5OtmiimGV10c8lOlDuzHs/HTTOyjuQrmAe+a5LP5cw/w2JhnHJkc/rxSY
	b6tbX2JNTl4h/U3V7gfF+OzkDKYngdap1ymNuC59YXnkMbTSa35B0XEVYh7HOGwz
	aINUi5vjOuhykAVh/q3c+06deRtf8uNv3bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793324383; x=
	1793410783; bh=wQV6hKwuFgiTM0haeZ8VIQuyAs/x1uTfCdWmXgdPkls=; b=Z
	izBHv2Rk4wZWT40HRMw/iaGzadhvQlV1FRJES/tIGjB2US0ncaB1AWqMafqHBIiu
	qdkPgFUUFyfQcgHfOkozEFrMtuSk3QqzKqxnDDB+geGl7nHgrAOOSx5b1NPbAEol
	pOpbdF+PVEee6GOevu06R841p9Pp4nxzP3Fv+/xseUOn9PTuV2leFBy3Yev1u6rb
	AluT8+U5Ymo/gn5wG6yPXMcPg+o9JnDNxU+7d/wKnq5Qp392G+lIy1Oa7S6Tbt7f
	zUYA89oKR/au5Wj3clAq1XOSWqZiVabcpA9bFxbE6Rc9XlTgiBI51RfLyvnTXwTg
	4uUq6TRj1pzztWLZ6mIIw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793324383; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:G1ek+CAw5hSXOXZWTspd4qbNfjcfrbnsCNXQrILiU3iVQaM
	hNtFgcVPn/vtPe1G7hNOHX70UEfufwgz397k25YtHOJmjGL5D6Hanvxi/kQumD1X
	7MJ0oBnt9sR7r99CE1BRVAgBXxqRL9ITlH6pRe8hgktQ8DrBKCV3faJF53lRhl0G
	XBAbls3BeIYThbvdiVJ3cNpBAoPNi8KZuo9Snr+Z9i2X+WgJv1j/eYb9JOzSAKZ4
	NZEiAKptTVWJjjPyWoMyk0Y+FkM7WWUNESmub/7mOGGZTiqy4Lpa+SVaMkZ8EDou
	TgUJktV0gK+9FgnQbiY7dSw5+xQrTYE4PWUYZxQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:Lyy+pQ2SvW0eWOGrDSCnoNOfovVkhI2cOnbAvca5JZU=:gZivCHvJ9ZTuqPkjWconFKXjonrZHzCaQBkQ9cvaOGw=;
X-ME-Sender: <xms:XvXjaqtSqSDj0O4Y_2ZmGWLQjnjMHbhEg5oYXYua6vGCkecHtdQcEg>
    <xme:XvXjakaKjpWL64y7BCkgNluu_KWMsQpYu_R0_LkmzEtsMXh5iS8f3HvRe3vNJtjQZ
    zH2O5VZccEZvHgACCqcDAIC9pZ6idZHKEF2ecc590rsmkjQAd0e>
X-ME-Received: <xmr:XvXjaqDz82sjPRfrmVsrS8Qn5mUQDJDKL6w9LL2dnpt5KcJEJJpwhoZ5ozvYfFVY4005TfV4SXl_e59HIpOx6yDx22tPJK4>
X-ME-Proxy-Cause: dmFkZTF/9DbQFoKPlgWwTkrJpVfBOt/hpIkrlW4693hGs8y51ZjQ1kfiJuq66ZHvmGVgsL
    jOyw3m5pPhklHHsyfzhZsGPD6Hj7ykqrrY8D0hrPrjgx6J5GI3Iov9ioPO/hvwNShV9aev
    0EboEq8B1W3B8Np0cCSqZApcr6AdsVAbLJciTqgeQbAG0uaMjPIFpZ42Udqeub3JT/iwdO
    3zG/C65XLdsfFpX4f7WIL5gGG++YR+V3sdw4EUNIhbhmftrDw9PoCQavXWgHgNOlUuXQTP
    PpNTi98HeYKgNmbho3AEN23OtmVtD6GMwnhj3aW+tcfDLY8JnTx7w1skqMIl1z3BKh0Efi
    s6JB1uEQaH7+vYG3ZKkJgOdINQIGthJuPFhjeXhswq0NCWrBQn0TWnoPYfGlvR2KAe356H
    cZjkbZeXHF+KaQYJ/aZ4BIx7cQwrb4MGP8/cZCN94m5pi1PmrNL/bwyWVKsTTP4huvCsui
    Tl47Hr2PNBAN95xDfrr/xTIH4t4LU1iC0GjmdfOXXT1h1QUL4FMdP1bCegxc4ZPONMaUa0
    vcq3Gj8Ukle9irYYVnuGB9X3Xxi0nbT9PNK45uW2FYdpq7Atq2v5yIlWYLFt9yX1shyVSe
    Nnf889+53H9mfFlmRzD671kdZB8plLD2VqXRfrDnfhCxpWjI8hIjYngXTr+g
X-ME-Proxy: <xmx:XvXjak8x4oxdoigJ71mB4W_r0PdYnLI80Ir4kY9azZuchhjfacy8_Q>
    <xmx:XvXjauT0dvR9c1zOEB3dGqmRd1Ky0aeESJP3-zwxnFgXWeLS_-zCvg>
    <xmx:XvXjagUEp-hEvia9OViOV0YwCxth-ihiIzll3JBEQJCPh-Ytuj3rUg>
    <xmx:XvXjagRt-5qHfzsJWEZ_vH6OxscFy0o40rEQ8zWJKEyhA5jYqcla9Q>
    <xmx:X_XjapCcqMZ3o7Poks6G6ly5TsVzXVu2sEVR_zeeAZz8yHK_tz0pg4z_>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Oct 2026 21:39:38 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Jimmy Zuber" <jamz@amazon.com>
Cc: "Miklos Szeredi" <miklos@szeredi.hu>, fuse-devel@lists.linux.dev,
 linux-kselftest@vger.kernel.org, "Shuah Khan" <shuah@kernel.org>,
 "Bernd Schubert" <bernd@bsbernd.com>, "Jim Harris" <jiharris@nvidia.com>,
 "Horst Birthelmer" <horst@birthelmer.de>, "Luis Henriques" <luis@igalia.com>
Subject: Re: [PATCH v6 1/2] fuse: add FUSE_OPEN_ATOMIC
In-reply-to: <20261029130758.818617-2-jamz@amazon.com>
References: <20261029130758.818617-1-jamz@amazon.com>
  <20261029130758.818617-2-jamz@amazon.com>
Date: Fri, 30 Oct 2026 12:39:34 +1100
Message-id: <179332437497.269288.7305999595462479305@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Fri, 30 Oct 2026, Jimmy Zuber wrote:
> Add FUSE_OPEN_ATOMIC, which looks up a name, creates it for O_CREAT, and
> opens it in one request, so that ->atomic_open() needs no FUSE_LOOKUP
> before FUSE_OPEN or FUSE_CREATE. After a -ENOSYS reply the kernel sends
> FUSE_LOOKUP, as it does for FUSE_CREATE.
>=20
> The request carries fuse_create_in and the name. The server replies with
> the entry and, if it opened the file, fuse_open_out:
>=20
> - an existing regular file: the server opens it;
> - a new name with O_CREAT: the server creates and opens it, and sets
>   FOPEN_CREATED;
> - any other file: the server returns the entry only, and the VFS opens
>   it;

Why is this a requirement?  I understand that the server *may* choose to
not open the file, so that the open doesn't happen until after the
permission check.  But shouldn't be up to the server to decide.

> - a missing name without O_CREAT: the server returns a zero nodeid,
>   cached like a negative LOOKUP.
>=20
> The VFS checks the open after the reply, as for other ->atomic_open()
> filesystems, and the kernel releases the file if the check fails.
> FMODE_CREATED is set only when the server reports FOPEN_CREATED.

The above para seems to suggest that the server might open a file that
wasn't created.

???

Thanks,
NeilBrown


>=20
> The request carries the open flags without O_TRUNC: the VFS truncates
> the opened file with SETATTR after its checks. With FUSE_ATOMIC_O_TRUNC,
> where FUSE_OPEN truncates, an O_TRUNC open keeps FUSE_LOOKUP. When the
> VFS may not create the file, it drops O_CREAT and keeps O_EXCL; that
> open keeps FUSE_LOOKUP, so an existing name gives -EEXIST.
>=20
> Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
> Signed-off-by: Jimmy Zuber <jamz@amazon.com>
> ---
>  fs/fuse/dir.c             | 193 ++++++++++++++++++++++++++++++++++++++
>  fs/fuse/fuse_i.h          |   6 ++
>  fs/fuse/fuse_trace.h      |   1 +
>  include/uapi/linux/fuse.h |  20 +++-
>  4 files changed, 219 insertions(+), 1 deletion(-)
>=20
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 4c64a4f812395..5820582ada650 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -938,6 +938,185 @@ static int fuse_create_open(struct mnt_idmap *idmap, =
struct inode *dir,
>  	return err;
>  }
> =20
> +/* Release the file the server opened for a reply the kernel rejects */
> +static void fuse_open_atomic_release(struct fuse_file *ff, u64 nodeid,
> +				     unsigned int open_size,
> +				     unsigned int flags)
> +{
> +	if (open_size >=3D FUSE_COMPAT_OPEN_OUT_SIZE && !invalid_nodeid(nodeid)) {
> +		ff->fh =3D ff->args->open_outarg.fh;
> +		ff->nodeid =3D nodeid;
> +		fuse_sync_release(NULL, ff, flags & ~(O_CREAT | O_EXCL));
> +	} else {
> +		fuse_file_free(ff);
> +	}
> +}
> +
> +/*
> + * Look the name up, create it for O_CREAT, and open it in one request.  T=
he
> + * server opens an existing regular file, returns only the entry of other
> + * files, and returns a zero nodeid for a missing name.  The VFS checks the
> + * open afterwards.  Returns 1 if the server replies -ENOSYS.
> + */
> +static int fuse_open_atomic(struct mnt_idmap *idmap, struct inode *dir,
> +			    struct dentry *entry, struct file *file,
> +			    unsigned int flags, umode_t mode)
> +{
> +	struct fuse_mount *fm =3D get_fuse_mount(dir);
> +	struct fuse_conn *fc =3D fm->fc;
> +	FUSE_ARGS(args);
> +	struct fuse_forget_link *forget;
> +	struct fuse_create_in inarg;
> +	struct fuse_open_out *outopen;
> +	struct fuse_entry_out outentry;
> +	struct inode *inode =3D NULL;
> +	unsigned int open_size;
> +	u64 attr_version, evict_ctr;
> +	struct fuse_file *ff;
> +	struct dentry *res;
> +	bool locked =3D false;
> +	int epoch, err;
> +
> +	if (entry->d_name.len > fc->name_max)
> +		return -ENAMETOOLONG;
> +	forget =3D fuse_alloc_forget();
> +	ff =3D fuse_file_alloc(fm, true);
> +	if (!forget || !ff) {
> +		kfree(forget);
> +		if (ff)
> +			fuse_file_free(ff);
> +		return -ENOMEM;
> +	}
> +	outopen =3D &ff->args->open_outarg;
> +	if (!fc->dont_mask)
> +		mode &=3D ~current_umask();
> +
> +	/* The VFS truncates the file after its checks */
> +	memset(&inarg, 0, sizeof(inarg));
> +	memset(&outentry, 0, sizeof(outentry));
> +	inarg.flags =3D flags & ~(O_NOCTTY | O_TRUNC);
> +	inarg.mode =3D mode;
> +	inarg.umask =3D current_umask();
> +	args.opcode =3D FUSE_OPEN_ATOMIC;
> +	args.nodeid =3D get_node_id(dir);
> +	args.in_numargs =3D 2;
> +	args.in_args[0].size =3D sizeof(inarg);
> +	args.in_args[0].value =3D &inarg;
> +	args.in_args[1].size =3D entry->d_name.len + 1;
> +	args.in_args[1].value =3D entry->d_name.name;
> +	args.out_numargs =3D 2;
> +	args.out_args[0].size =3D sizeof(outentry);
> +	args.out_args[0].value =3D &outentry;
> +	args.out_argvar =3D true;
> +	args.out_args[1].size =3D sizeof(*outopen);
> +	args.out_args[1].value =3D outopen;
> +
> +	if (flags & O_CREAT) {
> +		err =3D get_create_ext(idmap, &args, dir, entry, mode);
> +		if (err)
> +			goto out_free;
> +	} else {
> +		/* Locked as for a lookup */
> +		idmap =3D &invalid_mnt_idmap;
> +		locked =3D fuse_lock_inode(dir);
> +	}
> +	epoch =3D atomic_read(&fc->epoch);
> +	attr_version =3D fuse_get_attr_version(fc);
> +	evict_ctr =3D fuse_get_evict_ctr(fc);
> +	err =3D fuse_simple_idmap_request(idmap, fm, &args);
> +	fuse_unlock_inode(dir, locked);
> +	free_ext_value(&args);
> +	if (err < 0) {
> +		if (err =3D=3D -ENOSYS) {
> +			fc->no_open_atomic =3D 1;
> +			err =3D 1;
> +		} else if (err =3D=3D -EEXIST) {
> +			fuse_invalidate_entry(entry);
> +		}
> +		goto out_free;
> +	}
> +
> +	open_size =3D args.out_args[1].size;
> +	if (open_size && (outopen->open_flags & FOPEN_CREATED))
> +		fuse_dir_changed(dir);
> +	err =3D -EIO;
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
> +		inode =3D fuse_iget(dir->i_sb, outentry.nodeid,
> +				  outentry.generation, &outentry.attr,
> +				  ATTR_TIMEOUT(&outentry), attr_version,
> +				  evict_ctr);
> +		err =3D -ENOMEM;
> +		if (!inode)
> +			goto out_reject;
> +		fuse_advise_use_readdirplus(dir);
> +	}
> +	kfree(forget);
> +
> +	if (!open_size) {
> +		fuse_file_free(ff);
> +		res =3D d_splice_alias(inode, entry);
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
> +		file->f_mode |=3D FMODE_CREATED;
> +	ff->fh =3D outopen->fh;
> +	ff->nodeid =3D outentry.nodeid;
> +	ff->open_flags =3D outopen->open_flags & ~FOPEN_CREATED;
> +	d_splice_alias(inode, entry);
> +	fuse_dentry_set_epoch(entry, epoch);
> +	fuse_change_entry_timeout(entry, &outentry);
> +
> +	err =3D generic_file_open(inode, file);
> +	if (!err) {
> +		file->private_data =3D ff;
> +		err =3D finish_open(file, entry, fuse_finish_open);
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
>  static int fuse_mknod(struct mnt_idmap *, struct inode *, struct dentry *,
>  		      umode_t, dev_t);
>  static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
> @@ -951,6 +1130,20 @@ static int fuse_atomic_open(struct inode *dir, struct=
 dentry *entry,
>  	if (fuse_is_bad(dir))
>  		return -EIO;
> =20
> +	/*
> +	 * With atomic_o_trunc, FUSE_OPEN truncates after a FUSE_LOOKUP.  O_EXCL
> +	 * without O_CREAT, where the VFS may not create the file, needs the
> +	 * FUSE_LOOKUP so that do_open() reports -EEXIST for an existing name.
> +	 */
> +	if (!fc->no_open_atomic &&
> +	    !((file->f_flags & O_TRUNC) && fc->atomic_o_trunc) &&
> +	    ((flags & O_CREAT) || (d_in_lookup(entry) && !(flags & O_EXCL)))) {
> +		err =3D fuse_open_atomic(idmap, dir, entry, file, flags,
> +				       mode | S_IFREG);
> +		if (err <=3D 0)
> +			return err;
> +	}
> +
>  	if (d_in_lookup(entry)) {
>  		struct dentry *res =3D fuse_lookup(dir, entry, 0);
>  		if (res || d_really_is_positive(entry))
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index c91af283aef20..c680e106bf77a 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -50,6 +50,9 @@
>  /** Number of dentries for each connection in the control filesystem */
>  #define FUSE_CTL_NUM_DENTRIES 5
> =20
> +/** Size of fuse_open_out without backing_id_64 */
> +#define FUSE_COMPAT_OPEN_OUT_SIZE offsetofend(struct fuse_open_out, backin=
g_id)
> +
>  /*
>   * Dentries invalidation workqueue period, in seconds.  The value of this
>   * parameter shall be >=3D FUSE_DENTRY_INVAL_FREQ_MIN seconds, or 0 (zero)=
, in
> @@ -617,6 +620,9 @@ struct fuse_conn {
>  	/** @no_create: Is create not implemented by fs? */
>  	unsigned no_create:1;
> =20
> +	/** @no_open_atomic: Is FUSE_OPEN_ATOMIC not implemented by fs? */
> +	unsigned no_open_atomic:1;
> +
>  	/** @no_bmap: Is bmap not implemented by fs? */
>  	unsigned no_bmap:1;
> =20
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
> =20
>  /*
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 616430a2973c6..2986b247db615 100644
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
> =20
>  #ifndef _LINUX_FUSE_H
> @@ -292,7 +295,7 @@
>  #define FUSE_KERNEL_VERSION 7
> =20
>  /** Minor version number of this interface */
> -#define FUSE_KERNEL_MINOR_VERSION 47
> +#define FUSE_KERNEL_MINOR_VERSION 48
> =20
>  /** The node ID of the root inode */
>  #define FUSE_ROOT_ID 1
> @@ -406,6 +409,7 @@ struct fuse_file_lock {
>   *                           (FUSE_URING_ZERO_COPY) and the request carrie=
s page
>   *                           payload. Otherwise reads/writes fall back to
>   *                           copying.
> + * FOPEN_CREATED: FUSE_OPEN_ATOMIC created the file
>   */
>  #define FOPEN_DIRECT_IO		(1 << 0)
>  #define FOPEN_KEEP_CACHE	(1 << 1)
> @@ -416,6 +420,7 @@ struct fuse_file_lock {
>  #define FOPEN_PARALLEL_DIRECT_WRITES	(1 << 6)
>  #define FOPEN_PASSTHROUGH	(1 << 7)
>  #define FOPEN_IO_URING_ZERO_COPY (1 << 8)
> +#define FOPEN_CREATED		(1 << 9)
> =20
>  /*
>   * INIT request/reply flags
> @@ -699,6 +704,19 @@ enum fuse_opcode {
>  	FUSE_STATX		=3D 52,
>  	FUSE_COPY_FILE_RANGE_64	=3D 53,
> =20
> +	/*
> +	 * FUSE_OPEN_ATOMIC looks up a name, creates it for O_CREAT, and opens
> +	 * it. The request carries fuse_create_in, without O_TRUNC, and the
> +	 * name. The reply is fuse_entry_out, followed by fuse_open_out if the
> +	 * server opened the file, with FOPEN_CREATED if it created it. The
> +	 * server opens an existing regular file, and returns the entry only
> +	 * for other files, -EEXIST for an existing name with O_CREAT | O_EXCL,
> +	 * and a zero nodeid for a missing name without O_CREAT. The kernel
> +	 * checks the open after the reply and releases the file if the check
> +	 * fails. After a -ENOSYS reply the kernel sends FUSE_LOOKUP instead.
> +	 */
> +	FUSE_OPEN_ATOMIC	=3D 54,
> +
>  	/* CUSE specific operations */
>  	CUSE_INIT		=3D 4096,
> =20
> --=20
> 2.50.1
>=20
>=20

