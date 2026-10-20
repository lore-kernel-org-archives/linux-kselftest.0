Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792538647;
	b=2KrO6lWd3uR1Du8yEs9xa3LKJ2bv3aX9B5hYwYo5XHKQeKkvX4CTDzyWfiIrgVgXk2Dz
	 HVP1w+10DsGlTeZ7U8pQhK884h57ABR2cEAT8BBByKfkq9iA7RPLUVfVRUt+M+iIgD5sL
	 5YyUTj6Yt9eRPp4+h1V8qqmqPUHBE3Iqr02FiHcsjn4U07S14gVGSTye6qGR/TmozGE3g
	 Q71Q2h3tMNIeO/lvQZqvpOCF4KzFvaPFOgiclHk6sKhmmzaApHjgygIZ/SDEUBAqFimYw
	 b+ib9m7QdQRi3vo6F4qQLenIsH+VPlQlzmjY0nvnpkBOI8kiMiIQp1QLYiTy5ytuP6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792538647;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Content-Type:Content-Transfer-Encoding:MIME-Version:From:To:
	 Cc:Subject:In-reply-to:References:Date:Message-id:Reply-To;
	bh=m93/5adlurF89b+l4gDR1WEiHyoUAoJGQAA/6nptpHE=;
	b=teOPP+yZC+16JKr8xn8JZIwOZzc/QLSTnPCqkaINhY17QrcIJenm7omHnZLEKejo/eXK
	 LjWwmyeE4nh65wDBiDL3TAfVhbaPQV35mnbBRIX2Fm/UVZAMYKlAsc8/pPvHpLyQddNqO
	 TIYMKptTzsy7Kg4Ek/TUtxlrhEF1hB2g4eRzXu2dPMDyMcm87qAkhIC1dCISoHraDBlxU
	 d0KT2vBGX+SNb7E+gi4JP0XwFNoVIXTD8qvzFLHCzIlH9ua30kapEvzclvOupO/ZpDK61
	 YyPdWWhiJOR31L5DJk+VSq3nGACXB7LhR8RLYOKgmKPhJiYW85uYuOuhGCkdXPdoAxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ownmail.net;
	spf=pass smtp.mailfrom=ownmail.net;
	dkim=pass header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=gT+pUwzi;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=R2YRmVhV;
	arc=none smtp.remote-ip=202.12.124.155
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DF4606A319
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 23:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8DF4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ownmail.net header.i=@ownmail.net header.a=rsa-sha256 header.s=fm2 header.b=gT+pUwzi;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=R2YRmVhV
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E2F187A00DF
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 19:24:05 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 20 Oct 2026 19:24:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm2; t=
	1792538645; x=1792625045; bh=m93/5adlurF89b+l4gDR1WEiHyoUAoJGQAA
	/6nptpHE=; b=gT+pUwziYC+eLeje432CS84gpOAqTaYjuQso9l5jp6Hk2iZUPRr
	DO366tOv2Xlq26u/ncTZwUVL4Sczaww6FAO9DG1xtfm827Pql04+A94cytzG+zya
	iu8InSU8TCsLvNWt9ZN3xGIyj8MjjF4THhfZd+jhUgP0FsSWTv6VeF7CRofErjbo
	mXh+vw9ttadn0+XGspYGuWoSM61CiUKYtPJtseyQAEFBQOrePFZuB6sF2BLG/JkR
	OVVzd90MDbAeqkTB45B8RPej9GIZXXS3SmtPQfkI2PL8Owdk/YFw8KeqFAXSVo7l
	bx+jfylrl/Ogov+12L09Ah5agfTJad1etwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792538645; x=
	1792625045; bh=m93/5adlurF89b+l4gDR1WEiHyoUAoJGQAA/6nptpHE=; b=R
	2YRmVhVz23nongs9ED/DARc5FKanljttCrwaA5g2tWQR6VgwzVghBnVEV6Elm3f7
	vPTNyq91w28m6p5jzMNAO4jmOnYiE4RCsySlcHriwQuJ0x6aA6I8n8ULebQOebFk
	t7Ouu8EMFDe6a/oMH9MKUSrz5k1IHKWLDsq9heR3KOxNmWqoGiLYZoSfkCpW911l
	ihZaMXZah+LSdeaAVJhXbr2z00c5bSFu1WFMwO3H/fN5fKfxB2Jv0DPDYkygCaYs
	XC65jCOe1wezbV8M//J39dUT0xBPbGTnlRIF5FeTos7qhzVYPQ44IXC/Qpmas3Ir
	IdGMyUYnWYIO5OgD+Wc1g==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=ownmail.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792538645; d=ownmail.net;
	mf=PG5laWxiQG93bm1haWwubmV0Pg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:J0RlBn9QbGIW/vhN3wf7Zz0Zxd2AnKPOxUmQW/dJTc7Z4Xe
	hI3JgB/fzPUgrkqBGgArj7lGz+mNLM/v1idLtnaDrTt3pEGZLrks8OeiFEluuEMt
	GMKNzyQ/MMdN10O27oSsRt2babjSkbdHKjLtOXjRMh84LK2knso76D+AMtHam+yK
	mjMaBkYE7pwew74nCdpDq4yTrCJXT/gFER6QvSa2OmwSoXXuXpw8WO8z5qU1UagS
	tfmq7hhJsNoeJ+38QI/YeKwC2dIsGu9GkS+3r+yJSQCTTARhU/yiW6uPzyb/i2W+
	xCQbhQOhY8rG4eR3y7apki5cZ25G+EpVDxFooHQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,reply-to,
	subject,to;
Message-Instance: m=1; h=sha256:sstMLNDq47Y3m29ScfU0ktKsSSoFiSFQypqJt8SAcSg=:ToKF+1HByErDpcD2A2aZ3aMdKRTAAMPaVcaVCnH7mcM=;
X-ME-Sender: <xms:FfjXagfz0VfAnNFkN0WMW8o7NGaxVpe-FAHqzZHSIqs0_K_LpZ0eNQ>
    <xme:FfjXanJ5vS6z7bqaHQJkH085vitlRHjCxChytc8ZPOwP5eplb6F_AOIKa0S6qtGPu
    RQfAtWVGPY2JE8SG1CZT9U-0a74G7MqpD73rm7oAqIjSFqL60I>
X-ME-Received: <xmr:FfjXalxRYXQdVJ28dP_9xAKc50qRUUEx6yJoQi7HZ1-e-UUvxwujs48gYEOqRa3emw>
X-ME-Proxy-Cause: dmFkZTF7MIhu5mIQ/LdGhlF/QC93i71dvIzwtqFtYkxwbL/q2JFjnK5vIHOy9ejhZXHJep
    uvg5QyK2tihi3JQJ+H6sZ2qpN/Nb2W5TH2T6hmmZwgPAnW8ZPkbdFuL/07Vds+hxingz2U
    SFSLLThsJJHcsjZm+fbRa9h6x3HDLgrlMlCrro8yNWCwc2n3A7XhOWWcBjK82xV/fGG2Q4
    p3CO/DiImkc/IP86oUeNb8CajsjLh1zmTpQ8cxUOcpQhIyiYZ+/IOdQ3RMb/VQdNnRjHPr
    XoGdwBV644kFv0qhh86zg7VWWvkMlx8OdLyj2ZFInO5qlzSidrAcYJUyDCaiDKlD99fuCD
    htG+Dn8ePlWq2nuRUtBT9Csf035jC7OaZM2eumD427K/Z7F53wtWpAsZmQVjEcVUR9gi8g
    keau0k55MAA8xrkBV91BRi4sJx/B6t/R7JrSpEs/NIDDVdbav9B/BgaBQzRuH03EF7j96C
    xalLRp9I4gqzcT8Q9mNF/7vP7SgLrqskKVjs4joazciFzsL2OatB9KEZ920qsMwChi2UkD
    oJI5FKAWKLtDNTtoyJIaZcaGFLLwSJCHlZnNJPqyQrT5ZIcXsYS+/HjJpYbj/8p4UhLbCT
    GO/LNN6w7Bfti8kPQJspm7Ge5aoUd++Uc16rOqTOawycD0F4nEzWqts6ck7g
X-ME-Proxy: <xmx:FfjXalsC-tbJevb7Ty7zGmbNkGTaxz4vO84zhuX-kCTOEXxqqGTGTQ>
    <xmx:FfjXagC_ewX4VGdG4xVUd31QTh-Q12xMoPOgTLjapRiINWoUXRAqAg>
    <xmx:FfjXavE5Fg8TOyUH8H5YZuAT8ukBhpd0op7rtmvFc1ZhUUZENnMMrw>
    <xmx:FfjXaoBqV0C43Oo5fMaHeEo5i4lXO0bMzKLqHi7WNdRgyK7btsaNDg>
    <xmx:FfjXany9jupRsfSsN7mTMdYIhJDrubVLLPicWEsU0Ki880MOdCm586O3>
Feedback-ID: i9d664b8f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 Oct 2026 19:24:01 -0400 (EDT)
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
To: "jamz" <jamz@amazon.com>
Cc: "Miklos Szeredi" <miklos@szeredi.hu>, "Jimmy Zuber" <jamz@amazon.com>,
 fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org,
 "Shuah Khan" <shuah@kernel.org>, "Bernd Schubert" <bernd@bsbernd.com>,
 "Jim Harris" <jiharris@nvidia.com>, "Horst Birthelmer" <horst@birthelmer.de>,
 "Luis Henriques" <luis@igalia.com>
Subject: Re: [PATCH 1/3] fuse: add FUSE_OPEN_ATOMIC
In-reply-to: <20261020141647.3271341-2-jamz@amazon.com>
References: <20261020141647.3271341-1-jamz@amazon.com>
  <20261020141647.3271341-2-jamz@amazon.com>
Date: Wed, 21 Oct 2026 10:23:57 +1100
Message-id: <179253863737.1724252.12836488084615923712@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Wed, 21 Oct 2026, jamz wrote:
> From: Jimmy Zuber <jamz@amazon.com>
>=20
> Add FUSE_OPEN_ATOMIC, allowing the kernel to skip LOOKUP to improve
> performance. A server implementing FUSE_OPEN_ATOMIC will look up
> the name, create it if O_CREAT is supplied, and open it in one request.
>=20
> The server replies with the entry and the open file. If the file was
> created, the server returns FOPEN_CREATED, or just the entry if it
> was not created. If the name does not exist, the server returns a
> zero nodeid, cacheable like a negative LOOKUP. An existing file
> opened with O_TRUNC is returned unopened, so that truncation can be
> performed after permissions are checked.
>=20
> FMODE_CREATED is set only when the server reports that it created the
> file. Therefore a file created by someone else between LOOKUP and
> CREATE is no longer opened without a permission check.
>=20
> A server without the request replies -ENOSYS, and the kernel falls back to
> FUSE_LOOKUP, keeping backwards compatibility.
>=20
> Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
> Signed-off-by: Jimmy Zuber <jamz@amazon.com>
> ---
>  fs/fuse/dir.c             | 112 +++++++++++++++++++++++++++++++++++---
>  fs/fuse/fuse_i.h          |   3 +
>  include/uapi/linux/fuse.h |   8 ++-
>  3 files changed, 113 insertions(+), 10 deletions(-)
>=20
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index f48fafccce4b..34d2271eb248 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -815,7 +815,47 @@ static void free_ext_value(struct fuse_args *args)
>  }
> =20
>  /*
> - * Atomic create+open operation
> + * FUSE_OPEN_ATOMIC found an existing name and left the open to the VFS.  A
> + * zero nodeid means the name does not exist.
> + */
> +static int fuse_open_atomic_found(struct inode *dir, struct dentry *entry,
> +				  struct file *file,
> +				  struct fuse_entry_out *outarg,
> +				  struct fuse_forget_link *forget, int epoch,
> +				  u64 attr_version, u64 evict_ctr)
> +{
> +	struct fuse_conn *fc =3D get_fuse_conn(dir);
> +	struct inode *inode =3D NULL;
> +	struct dentry *res;
> +
> +	if (outarg->nodeid) {
> +		inode =3D fuse_iget(dir->i_sb, outarg->nodeid, outarg->generation,
> +				  &outarg->attr, ATTR_TIMEOUT(outarg),
> +				  attr_version, evict_ctr);
> +		if (!inode) {
> +			fuse_chan_queue_forget(fc->chan, forget,
> +					       outarg->nodeid, 1);
> +			return -ENOMEM;
> +		}
> +	}
> +	kfree(forget);
> +	if (inode && get_node_id(inode) =3D=3D FUSE_ROOT_ID) {
> +		iput(inode);
> +		return -EIO;
> +	}
> +
> +	d_drop(entry);
> +	res =3D d_splice_alias(inode, entry);

As of f1ac607f786f d_splice_alias() handles hashed dentries
and the d_drop() is not needed and not wanted.


> +	if (!IS_ERR(res)) {
> +		fuse_dentry_set_epoch(res ?: entry, epoch);
> +		fuse_change_entry_timeout(res ?: entry, outarg);
> +	}
> +	return finish_no_open(file, res);
> +}
> +
> +/*
> + * Atomic create+open operation, or lookup with optional create and open f=
or
> + * FUSE_OPEN_ATOMIC
>   *
>   * If the filesystem doesn't support this, then fall back to separate
>   * 'mknod' + 'open' requests.
> @@ -833,8 +873,12 @@ static int fuse_create_open(struct mnt_idmap *idmap, s=
truct inode *dir,
>  	struct fuse_entry_out outentry;
>  	struct fuse_inode *fi;
>  	struct fuse_file *ff;
> +	u64 attr_version, evict_ctr;
>  	int epoch, err;
>  	bool trunc =3D flags & O_TRUNC;
> +	bool atomic =3D opcode =3D=3D FUSE_OPEN_ATOMIC;
> +	bool create =3D !atomic || (flags & O_CREAT);
> +	bool locked, created;
> =20
>  	/* Userspace expects S_IFREG in create mode */
>  	BUG_ON((mode & S_IFMT) !=3D S_IFREG);
> @@ -878,26 +922,62 @@ static int fuse_create_open(struct mnt_idmap *idmap, =
struct inode *dir,
>  	outopenp =3D &ff->args->open_outarg;
>  	args.out_args[1].size =3D sizeof(*outopenp);
>  	args.out_args[1].value =3D outopenp;
> +	/* FUSE_OPEN_ATOMIC leaves out fuse_open_out if it did not open */
> +	args.out_argvar =3D atomic;
> =20
> -	err =3D get_create_ext(idmap, &args, dir, entry, mode);
> -	if (err)
> -		goto out_free_ff;
> +	if (create) {
> +		err =3D get_create_ext(idmap, &args, dir, entry, mode);
> +		if (err)
> +			goto out_free_ff;
> +	} else {
> +		idmap =3D &invalid_mnt_idmap;
> +	}
> =20
> +	attr_version =3D fuse_get_attr_version(fm->fc);
> +	evict_ctr =3D fuse_get_evict_ctr(fm->fc);
> +
> +	/* Without O_CREAT the parent is locked shared, as for a lookup */
> +	locked =3D !create && fuse_lock_inode(dir);
>  	err =3D fuse_simple_idmap_request(idmap, fm, &args);
> +	fuse_unlock_inode(dir, locked);
>  	free_ext_value(&args);
> -	if (err)
> +	if (err < 0)
>  		goto out_free_ff;
> =20
>  	err =3D -EIO;
> +	if (atomic && !args.out_args[1].size) {
> +		/* A zero nodeid: the name does not exist and was not created */
> +		if (!outentry.nodeid && create)
> +			goto out_free_ff;
> +		if (outentry.nodeid && (invalid_nodeid(outentry.nodeid) ||
> +					fuse_invalid_attr(&outentry.attr)))
> +			goto out_free_ff;
> +		fuse_file_free(ff);
> +		return fuse_open_atomic_found(dir, entry, file, &outentry,
> +					      forget, epoch, attr_version,
> +					      evict_ctr);
> +	}
> +
>  	if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nodeid) ||
> -	    fuse_invalid_attr(&outentry.attr))
> +	    fuse_invalid_attr(&outentry.attr) ||
> +	    args.out_args[1].size !=3D sizeof(*outopenp))
>  		goto out_free_ff;
> =20
> +	created =3D !atomic || (outopenp->open_flags & FOPEN_CREATED);
> +	if (atomic) {
> +		/* Only O_CREAT creates; O_TRUNC opens are left to the VFS */
> +		if ((created && !create) || (!created && trunc))
> +			goto out_free_ff;
> +		if (created)
> +			file->f_mode |=3D FMODE_CREATED;
> +	}
> +
>  	ff->fh =3D outopenp->fh;
>  	ff->nodeid =3D outentry.nodeid;
>  	ff->open_flags =3D outopenp->open_flags;
>  	inode =3D fuse_iget(dir->i_sb, outentry.nodeid, outentry.generation,
> -			  &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
> +			  &outentry.attr, ATTR_TIMEOUT(&outentry),
> +			  created ? 0 : attr_version, created ? 0 : evict_ctr);
>  	if (!inode) {
>  		flags &=3D ~(O_CREAT | O_EXCL | O_TRUNC);
>  		fuse_sync_release(NULL, ff, flags);
> @@ -906,10 +986,14 @@ static int fuse_create_open(struct mnt_idmap *idmap, =
struct inode *dir,
>  		goto out_err;
>  	}
>  	kfree(forget);
> -	d_instantiate(entry, inode);
> +	if (d_in_lookup(entry))
> +		d_splice_alias(inode, entry);
> +	else
> +		d_instantiate(entry, inode);

Similar to above, d_splice_alias() is now sufficient for all cases.

Thanks,
NeilBrown

>  	fuse_dentry_set_epoch(entry, epoch);
>  	fuse_change_entry_timeout(entry, &outentry);
> -	fuse_dir_changed(dir);
> +	if (created)
> +		fuse_dir_changed(dir);
>  	err =3D generic_file_open(inode, file);
>  	if (!err) {
>  		file->private_data =3D ff;
> @@ -947,6 +1031,16 @@ static int fuse_atomic_open(struct inode *dir, struct=
 dentry *entry,
>  	if (fuse_is_bad(dir))
>  		return -EIO;
> =20
> +	if (!fc->no_open_atomic && (d_in_lookup(entry) || (flags & O_CREAT))) {
> +		err =3D fuse_create_open(idmap, dir, entry, file, flags,
> +				       mode | S_IFREG, FUSE_OPEN_ATOMIC);
> +		if (err =3D=3D -EEXIST)
> +			fuse_invalidate_entry(entry);
> +		if (err !=3D -ENOSYS)
> +			return err;
> +		fc->no_open_atomic =3D 1;
> +	}
> +
>  	if (d_in_lookup(entry)) {
>  		struct dentry *res =3D fuse_lookup(dir, entry, 0);
>  		if (res || d_really_is_positive(entry))
> diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
> index 8546855386b5..ba6dc4c43a1f 100644
> --- a/fs/fuse/fuse_i.h
> +++ b/fs/fuse/fuse_i.h
> @@ -589,6 +589,9 @@ struct fuse_conn {
>  	/** @no_create: Is create not implemented by fs? */
>  	unsigned no_create:1;
> =20
> +	/** @no_open_atomic: Is open atomic not implemented by fs? */
> +	unsigned no_open_atomic:1;
> +
>  	/** @no_bmap: Is bmap not implemented by fs? */
>  	unsigned no_bmap:1;
> =20
> diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
> index 10a7f31c4bdf..745b686c468f 100644
> --- a/include/uapi/linux/fuse.h
> +++ b/include/uapi/linux/fuse.h
> @@ -251,6 +251,9 @@
>   *
>   *  7.47
>   *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
> + *
> + *  7.48
> + *  - add FUSE_OPEN_ATOMIC and FOPEN_CREATED
>   */
> =20
>  #ifndef _LINUX_FUSE_H
> @@ -286,7 +289,7 @@
>  #define FUSE_KERNEL_VERSION 7
> =20
>  /** Minor version number of this interface */
> -#define FUSE_KERNEL_MINOR_VERSION 47
> +#define FUSE_KERNEL_MINOR_VERSION 48
> =20
>  /** The node ID of the root inode */
>  #define FUSE_ROOT_ID 1
> @@ -400,6 +403,7 @@ struct fuse_file_lock {
>   *                           (FUSE_URING_ZERO_COPY) and the request carrie=
s page
>   *                           payload. Otherwise reads/writes fall back to
>   *                           copying.
> + * FOPEN_CREATED: FUSE_OPEN_ATOMIC created the file
>   */
>  #define FOPEN_DIRECT_IO		(1 << 0)
>  #define FOPEN_KEEP_CACHE	(1 << 1)
> @@ -410,6 +414,7 @@ struct fuse_file_lock {
>  #define FOPEN_PARALLEL_DIRECT_WRITES	(1 << 6)
>  #define FOPEN_PASSTHROUGH	(1 << 7)
>  #define FOPEN_IO_URING_ZERO_COPY (1 << 8)
> +#define FOPEN_CREATED		(1 << 9)
> =20
>  /**
>   * INIT request/reply flags
> @@ -690,6 +695,7 @@ enum fuse_opcode {
>  	FUSE_TMPFILE		=3D 51,
>  	FUSE_STATX		=3D 52,
>  	FUSE_COPY_FILE_RANGE_64	=3D 53,
> +	FUSE_OPEN_ATOMIC	=3D 54,
> =20
>  	/* CUSE specific operations */
>  	CUSE_INIT		=3D 4096,
> --=20
> 2.50.1
>=20
>=20

