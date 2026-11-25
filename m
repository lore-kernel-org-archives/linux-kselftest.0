Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795649482;
	b=pjIZAgkqJnXeLWtBx1WkyV1pwilufXkQuQRXjhV8+e9ccKN4l0FQ67tdmOBX9rJKw1Eu
	 NBe0lGVHmZ1c8J3eur4Z3PqYnDmrLLUf0JddudSyMzZ+EmTXK77lq+OyihIOiqXl9G9g9
	 t2lIi1oPXuj1mBu+9mMFGfvweC/UKM/Hvzkcqc3TIVh2XTfp5yVdk00SCPGcUyve++tKt
	 tkiFXeSr+vm51kOClcpgPkVcrfH/rRBtWneluNKhTicLxyvCFg5MTRFSMTYUhXlBRKu72
	 Jk96ZvUf/vm5Z1EPCLCcXhzeRgVzvNW32ppbucU71pAphKuyi6+ovZuiNeK9a6oEMzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795649482;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=s+TzZ5ACUx4zij/ph3j2HNaJI7CVDuz6+fYGXK+peMs=;
	b=vhTo8YsMAt5qxjWDaXTCyfHVX8jpbxVXCBMuKyLnKT2KuOQZ4hsovGCIY6gSa5fFQ0JP
	 diw3r1lDLLDuLUF9SUKNtQDP0L3wMd0V6fHWkEriDnY8tk+aArINSBxCZ2K+OQkoNrlfJ
	 UCmHITAPhg9fMfb8ChLTkZPiSKN8l9f5jq+k7R8C93fiJ105UVQUZLwJ4ZRtEB1onsAzZ
	 EMuChdkMqbwHBFkhkEv56MegOVcnyP4D6258JXFciObtm91rcN6D5M1f74UeagHfK5Yio
	 d9rvcRVftFm72taGYhrMBpYTIVT+eEfotqr7T9NB9yYsg9obD/2E1TYm6fXdoSanRqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bsbernd.com;
	spf=pass smtp.mailfrom=bsbernd.com;
	dkim=pass header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=EWJ0X3s6;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lolcTGf8;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557CB606A326
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 23:31:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 557CB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bsbernd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bsbernd.com header.i=@bsbernd.com header.a=rsa-sha256 header.s=fm2 header.b=EWJ0X3s6;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=lolcTGf8
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id CA6A31D0059B
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 18:31:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Wed, 25 Nov 2026 18:31:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bsbernd.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795649481;
	 x=1795735881; bh=s+TzZ5ACUx4zij/ph3j2HNaJI7CVDuz6+fYGXK+peMs=; b=
	EWJ0X3s66gkNcgIiMEDEpVkyzmaqaw+ISCuNMrsgDQ7E0gUsvzi4oahK3JbFjQ4B
	/EhraEtHv78jjo4xNiYoo9rtKYX87ICsA1aRGDxE0Z+N7yP92VZtPzHUOhvTSuuc
	kkMUuFBCRT4S+xXYetKkGFOa3j5Szzci3YGDmuDpEY7qMBJ55bD5fzXEEjBU+Yn7
	uonhQlonYx9s0X0uEyNHAsFn93VP7XbUGB00pao97Xx+lBedR+p2rbtitv4n/ulc
	Qq+mSFRl6iqXaXVkbwKgI/MtlB8nw9H6ORT1viXv0yS8U9teT0utMC3B2fJUJ/R3
	xQsEt9XE4VBFpWzMnudNnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795649481; x=
	1795735881; bh=s+TzZ5ACUx4zij/ph3j2HNaJI7CVDuz6+fYGXK+peMs=; b=l
	olcTGf8YCNzjpDfDL/m6llTpAadpu0iL485OIDeurqlHmcfsdw0kVtIVf1jOfTey
	xNLQfomQNG8KOCdpE/n2tU0wOpAldidyBdbXpK3CAJmAhBZTBj0N3GAcc+12Gxks
	OH9W1+8VykZF25r9qHqNtBHrg0y54dad7QcXyuwQKld4jBf9cYp80vMdNzafraVW
	QOkMmqS48TTg8U6g+sRF6Jn9cafiKYMb8ckB7zxI32xch86AQh8ASTjbs7vffRpY
	Y9JfzEE9gfEFNWJmlTtqYCEMJYDnwHBQp32bVXV04+0ZqOdZC1f5aOVjbOz+uGut
	487+lg8Q6vcvY/6doW6cw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=bsbernd.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795649481; d=bsbernd.com;
	mf=PGJlcm5kQGJzYmVybmQuY29tPg==;
	rt=PGxpbnV4LWtzZWxmdGVzdEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:luukiVQJQWI9MnAe5i4/N/ux3IIAtNUkZG7V/gtY4vBEFvK
	V+DpfldaeIyXIjx5zAONtd3FomkBXGGF/IS6WVx9EQ97yF79WpoDf29XeBQW01TX
	g9zwFO+a+TI4OTUj+hTjklZzElVeDuV5u7XGOA15AF0oAgHzTCZMhffDt+8bnQkT
	WEtsIgvJyOsYvOCPcJUqwtiRW78pqCNApT6GQ7Kxd1/LwBwFgqFPTppgtWiHEzaN
	A9IJ5xnMqEPPg9x9D31bXt5k8mO4Kf3zfrqbmF5A3/yQflSOjS3hdTmyTtXGjADK
	1QCQ/bh641/rJnvwZYA3CTX/b4KdtRO6dLvwQiw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=14;
	hn=cc,content-language,content-transfer-encoding,content-type,
	date,feedback-id,from,in-reply-to,message-id,mime-version,
	references,subject,to,user-agent;
Message-Instance: m=1; h=sha256:SWgCQfBiCd48PXgorUxQ+hD3e4Xsh35qalu1pw9ZLoE=:YzmNTb7kJB/aTekz/rG3XodusqO5hcGR+JzUChZq9A8=;
X-ME-Sender: <xms:yG8Ha-9E39dQDnJoXgqfzq2KKTXPUrnrrEvPmtaKeCLOARvXE22SvQ>
    <xme:yG8HaxwVyIBBQCm_DDbmWvhOw5XTr6TsJdtrTHXq-9MY0FcOOanxpwVQtoNl-oCtL
    __7ov-X9kiFc3QaFoMGiXG26DSVPJ0jJR0lbyRcHQZZHgo4O6NqkFY>
X-ME-Received: <xmr:yG8Ha-r8FbJQXdEpZPq3EAnQVILf47256GlT1dR-ydassbQ78z6e3tXwAY5me_2VZ5mcWovcCLbdyxib4aUlZepGdwVa4bMPjoPY8eYfC8LekPhmXg>
X-ME-Proxy-Cause: dmFkZTFxYpFxJ3YyTg6hPxnRHDiZ4Ex1zotVkHaDA7iKovT1Jw13FTcHNzzb+VuqjIDOZY
    V772uS5LqC4o4k2PNvAjs5P4ecVa3VCOnKe0qV1sU3SHGPNNWuQ84OSTnSpCs9TvadUDHz
    mQCkyQXRJS4qpSacPJGy3el2PYdX3ADjjqTRwd0FUwPFv+yAunpxsLvCdIHnlzi/1O1AdX
    Er5NVsg5JK35hVh78rhbTu+9W9Cg7ZlBBarXxn8fPaBJpCFjeAbfXbqDXy+rwdQOWmSeS+
    ogHsovCdA6XpjU3j3p60aRpSyIphjODFfpOKq730fO8kj4jHF/q/9kW4TNP+aBac5gRSMa
    8rY5sXjhsP5NMJT9IdIYJMb16C9MMc8+5qQW+ukmQL5Yr9H1DNjpV3hf6Mpn78PYQKQK3/
    40lw91haAG/xiK6G/kqw7WpEV88DXIQzI4wJdRfmtjFUCporADDOeWjJqmRJ6JhlKTu7FN
    k0UFhygZPamaBxrLzHDV3wwytDtqvHV8Uj0uPvUEJM4iGejd/wjpgn/nhEKUbI3YT/L1kQ
    1UwvW2jUPsTYST+FUgFEvoUQ9bLzh8dTv5GSXwJdIgcIqeAafaR79u5iN2NP1ZvLCAf9yY
    f97UppvPjAUMLhJ4RBGS3mgzoj74Ej9YCFOvhVN/lT+7D8mOAoJZcCAbRFIA
X-ME-Proxy: <xmx:yG8HaypjUYE0wcJ0TnoDhM6FR6RclwYQQl9V5qDX63ZDVCx_Sk_YGA>
    <xmx:yG8Ha-BdN5lS1KrjJmpaKL3_puueseHCa3qPr8C0QFEJ75YJQKR7PA>
    <xmx:yG8HawtJ3Id7WTWRMIA6EzSyfEuDyGEMlOvCLui2cuXeQGHfFolBLg>
    <xmx:yG8Ha9K9CSy3Te3Ww9WFNKoYy1SffmYVNrLUs3MKYx5PgUyGUmNj7w>
    <xmx:yW8HawUfcapvx57uj5ac8UeLFa5xIZb39wrzP6tr3hDQNBLbFQLLZXVv>
Feedback-ID: i5c2e48a5:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Nov 2026 18:31:19 -0500 (EST)
Message-ID: <6476224e-5b35-4249-9721-e2328aea5589@bsbernd.com>
Date: Thu, 26 Nov 2026 00:31:18 +0100
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
Subject: Re: [PATCH v9 1/3] fuse: move fuse_statx_to_attr() up
To: Jimmy Zuber <jamz@amazon.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: fuse-devel@lists.linux.dev, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Jim Harris <jiharris@nvidia.com>,
 Horst Birthelmer <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>,
 NeilBrown <neil@brown.name>, Joanne Koong <joannelkoong@gmail.com>
References: <20261121001608.996811-1-jamz@amazon.com>
 <20261121001608.996811-2-jamz@amazon.com>
From: Bernd Schubert <bernd@bsbernd.com>
Content-Language: fr, en-US, de-DE, ru-RU
In-Reply-To: <20261121001608.996811-2-jamz@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/21/26 01:16, Jimmy Zuber wrote:
> Move fuse_statx_to_attr() above fuse_atomic_open(), for use by
> FUSE_OPEN_ATOMIC in the next patch.
> 
> Signed-off-by: Jimmy Zuber <jamz@amazon.com>
> ---
>  fs/fuse/dir.c | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index da23ccd8685cf..a719e3516e187 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -935,6 +935,26 @@ static int fuse_create_open(const struct mnt_idmap *idmap, struct inode *dir,
>  	return err;
>  }
>  
> +static void fuse_statx_to_attr(struct fuse_statx *sx, struct fuse_attr *attr)
> +{
> +	memset(attr, 0, sizeof(*attr));
> +	attr->ino = sx->ino;
> +	attr->size = sx->size;
> +	attr->blocks = sx->blocks;
> +	attr->atime = sx->atime.tv_sec;
> +	attr->mtime = sx->mtime.tv_sec;
> +	attr->ctime = sx->ctime.tv_sec;
> +	attr->atimensec = sx->atime.tv_nsec;
> +	attr->mtimensec = sx->mtime.tv_nsec;
> +	attr->ctimensec = sx->ctime.tv_nsec;
> +	attr->mode = sx->mode;
> +	attr->nlink = sx->nlink;
> +	attr->uid = sx->uid;
> +	attr->gid = sx->gid;
> +	attr->rdev = new_encode_dev(MKDEV(sx->rdev_major, sx->rdev_minor));
> +	attr->blksize = sx->blksize;
> +}
> +
>  static int fuse_mknod(const struct mnt_idmap *, struct inode *, struct dentry *,
>  		      umode_t, dev_t);
>  static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
> @@ -1410,26 +1430,6 @@ static void fuse_fillattr(const struct mnt_idmap *idmap, struct inode *inode,
>  	stat->blksize = 1 << blkbits;
>  }
>  
> -static void fuse_statx_to_attr(struct fuse_statx *sx, struct fuse_attr *attr)
> -{
> -	memset(attr, 0, sizeof(*attr));
> -	attr->ino = sx->ino;
> -	attr->size = sx->size;
> -	attr->blocks = sx->blocks;
> -	attr->atime = sx->atime.tv_sec;
> -	attr->mtime = sx->mtime.tv_sec;
> -	attr->ctime = sx->ctime.tv_sec;
> -	attr->atimensec = sx->atime.tv_nsec;
> -	attr->mtimensec = sx->mtime.tv_nsec;
> -	attr->ctimensec = sx->ctime.tv_nsec;
> -	attr->mode = sx->mode;
> -	attr->nlink = sx->nlink;
> -	attr->uid = sx->uid;
> -	attr->gid = sx->gid;
> -	attr->rdev = new_encode_dev(MKDEV(sx->rdev_major, sx->rdev_minor));
> -	attr->blksize = sx->blksize;
> -}
> -
>  static int fuse_do_statx(const struct mnt_idmap *idmap, struct inode *inode,
>  			 struct file *file, struct kstat *stat)
>  {


Reviewed-by: Bernd Schubert <bernd@bsbernd.com>

[remaining review of the other patches tomorrow]
