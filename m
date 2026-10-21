Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792587657;
	b=KwSApUoyThMx+0KbGdoc1SKidffjbjJfOKEU8Tnhu/7PsGny3EFy9XABQP1+uMItPeFp
	 wP5zGzizN+xYP1Lf61nw3hJToWlSE+o+/dYuIl+GPYVTIo7kq6Qly7kzRcw8UP3IHeEHX
	 hmEqn7474GXDAuZfcMBDbylerpy+wWPTpoxBqULgYCCfLBtZAMtah98iwqNSrsfa1Wlw5
	 n184CIB8boVCGY6sOXGiTfZnEFw8PGrxsaQququkug08IYaE51orczqttmQNSV0bVx3PX
	 eS0P6/UPZvz1XYI+ItB+W2RqyZRU4/nMz3O17xy4ORnyyhXpxAc2rL6H1q8/5gH+T4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kXoYys6AGDFdddNSuFyoTToCIugSJAhRAIJkUtxGkCM=;
	b=l+hDG0DBhZa3cQHUxvq/5XMBXbMfwoCOZBY3kSOS4fGCdauksxizvRnc3KG6X13WEQNp
	 NWC3JJS5ucejV4FDXQ91WCmIEZyqAMwGVXW3YTHwwHMElBncRZ0u/4DU321QR8op7+8Ma
	 KIGBDggyAdAOyn5QPR8fcTF8Yu85SAnf1YrEoPg4JX5pvf/c3n7r50AeX0RtFc1TZ7sy/
	 6CBIBWB4Z9Inrv9YHTyd0nxyOykB+v/3y9nLGc8vU9bYPgWHYdRTin9Z22AMDnM2YEIui
	 SEx135CK/kI/GsykKZoBoktiSrxlX1KpAhMfnmoXbvakLF+yVi9iQBkOE0M4v5I0lIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ATuLUQhC;
	arc=fail smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C505606A31E
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 13:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C505606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ATuLUQhC
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b1d8944cb0so1028634a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 06:00:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792587655; cv=none;
        d=google.com; s=arc-20260327;
        b=bPy3ttRZFMJXlNfkZQ8/GdQhq0BS7JixiiaSfmLfqhbgODE1c41INJdKLJefXa180p
         emyoN8vjzDFaOEc01MxhLKx26gYKNfawexX2zIGAE4a5br/YJi4YuQyuniRGRepcJ4aB
         kVdorrZYhz0bEKpJX15R115SgmTXCtbp5dabC1vpzh9LtKUiB0h34wmFlQjNDLHdicHA
         czsUTy6iTFkIlao6z0XimmWE9whAHnauIOeLtmP570ZPBAnJ5NFGckrcho1jPPB8Ucxd
         ghC0wuBepK/T3Tw4PDCezHjI9kXq4254i65jmERtdqCXDu52tJ8wc7gd5KWZI1Jllhe3
         2nBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kXoYys6AGDFdddNSuFyoTToCIugSJAhRAIJkUtxGkCM=;
        fh=Gd22xSvnWKsJfqANIB+qf7xJwC3PifdXrTnCbaLS8M8=;
        b=tDUblYlXn3uZz8xtVFhPm18mFnWwAoDDTiExwtgkdEaOuODsjRje9DLFlFmnPhLKws
         u+M7+7HOyQv4WWNT5pUwJwumZizNXTq53UAgVP6v2d/h+5x44mrS76Z7wQA9CJQImGpa
         FYPqiJlZT3umSAsWfMmrdbUuBf4aXYkl+MRnIVPYDmVZ6+5k8mA/PSXbwU2wr10TU1C/
         pPTCUnnKrA+0cSCzAtPm5I52JfitTYR7eJ/Bax0pNEcgzajj292iA0olayiLaquFKGci
         LaRsSY7tDKPhYhMXSOiEGeut3nDBSTs3wgVaTMgd+F4IuPbYci6nMks+KhxGYK9NhR45
         3T8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792587655; x=1793192455; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kXoYys6AGDFdddNSuFyoTToCIugSJAhRAIJkUtxGkCM=;
        b=ATuLUQhCm7bNIC7Md6XGQY4GFQFK3oqAfo6awLZkDZVz5OvwY3So3XmmwcXFeZlTQc
         BgK6u3qgRI7hnMYXmWm8GvYPSVi3782HLsc5x9MxY5zGwodRLFAjVgituIjKB7igSnfw
         HkYxVqgGTrc5cbJcX8MLQnQ1MXbYv0Om6QUndvOcu/XjVIRX8hwCj47gXOVGdXEMru0I
         BRPD3BDq0VVn/hf9bKWIHRLb0UsfBQjmTMIVWtBLCJTVvLojZnoSUiWMxnQQj/ldGL7n
         eCXROZHcz0+5Bbj/i4GK+B1jzceI04aRQUhDIepgcD+2NA4Fkf3XPCK+2MPcL5tA5C0j
         MAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587655; x=1793192455;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXoYys6AGDFdddNSuFyoTToCIugSJAhRAIJkUtxGkCM=;
        b=Ft94KKpykKca2AsI8hCLHw3IvQ7lHM3amibIXhYuTpqjzoRuAYasliJc+rQpWKf+8W
         TbpDUpj5TWsRzjeElZsJUF646ALjQcZiExX/g19DbtuDaifyDoHUo4ZDlATtzhXD5PZG
         3D0IzzRP+ybpY/MT2+x+giA6gZEhK222OwKD1rqzxxPo2C1HIjZEaA34OwidzKp26U6e
         4wj01D4I7qsTtvSWCkm0ykyAkA6dGVZ+KxhBXnkGM2NMZtSJonAT21ZQePHtDERGg9Mh
         jV26wa8/U1U8SGsSQvG5Q+KRPRhre/IBhVxOOKrsniTEJpKYtbr/HBQY+nZ/U2/CIAcd
         g7uw==
X-Forwarded-Encrypted: i=1; AKwUvByinQrEcmRtHesXeHbNtzzRQoz/iZrWom6+n7fneAa24OyOKR6n94toos6dzA2yc9g2M2ivSffZ3XSL9WZObLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmKMX01dOBgw3ksbsS7Rggdz57kEDgZtbBdcFU81Dd9fSfd4ER
	QWeTx0NZPPCObcYZ3flESp2aVgfOix7+V3UpbleWtHfP3o83SY9ANoIw+aip0fOblbqpr9pl2Qx
	+K4bGeKuIBKHos6McKI28X3V3y31PDTXzdsmte3c=
X-Gm-Gg: AYBFou3a55rKNnNQ+8bDMubZ6uNTC1GuyvBDvjsG1OPVeZr0mAHObSjEw8rEytfMMee
	jzXon6DiODUlZzcGULvlCnU62/48k+4IkqKqe5bj4t+rrSFFwdmf0WmRGbxnpcX4sMLoQyl+KFp
	Kn9LWASshEWhrABOCGentZLm+X4ZBv1p0I5381VPtK/JTS9RxmcXzsbGlKWjnhn1HvdSxi2zqUZ
	e1vZAcQ2S+tMpJ4oSztFfy4gsBd8INH+WXu7tCf0bXSNkoBUbly/hk7kL5YGL9VmagpqxVBJoWW
	o9m/jshdqq28Z7ULvd15oK5YoYWjyy6A8JBmHpfsF1YNaghFadtC2GLlqlj0wua5YctuXmV00aQ
	APoqKJO2prX5buLoZNEw0+XvWrGLtuZzdHapw
X-Received: by 2002:a05:6402:280f:b0:6b4:16fb:b9ba with SMTP id
 4fb4d7f45d1cf-6b416fbbe8emr581616a12.36.1792587653646; Wed, 21 Oct 2026
 06:00:53 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260924112858.51392-1-disgoel@linux.ibm.com> <20260924112858.51392-2-disgoel@linux.ibm.com>
 <20261021-erbschaft-gefahndet-erklangen-085a518222a3@brauner>
In-Reply-To: <20261021-erbschaft-gefahndet-erklangen-085a518222a3@brauner>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 21 Oct 2026 15:00:40 +0200
X-Gm-Features: AclHuK9WcoBrCyRwmmWQl42Ua6CkryoBn_QB6lJW1f-3Kmj5TuvGleJ2mOxIsU0
Message-ID: <CAOQ4uxgO5xW39SfBEfM5yS4uV7M6_zZu7kVP++bNwML2s6ZPsA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ovl: fix wrong layer paths in mountinfo for detached
 mount FDs
To: Christian Brauner <brauner@kernel.org>
Cc: Disha Goel <disgoel@linux.ibm.com>, miklos@szeredi.hu, viro@zeniv.linux.org.uk, 
	jack@suse.cz, shuah@kernel.org, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 1:56=E2=80=AFPM Christian Brauner <brauner@kernel.o=
rg> wrote:
>
> On Thu, Sep 24, 2026 at 04:58:58PM +0530, Disha Goel wrote:
> > When overlayfs layers are passed as detached mount file descriptors
> > (opened with open_tree(OPEN_TREE_CLONE)), ovl_parse_layer() uses d_path=
()
> > to record the layer's path for display in mountinfo.
> >
> > d_path() walks up the mount tree to the process's filesystem root.  For
> > detached mounts this walk stops at the anonymous namespace root instead
> > of the real system root, producing a short incorrect path like "/l1"
> > instead of the full absolute path.
> >
> > Export mnt_is_anon() from fs/namespace.c to detect detached mounts.  In
> > ovl_parse_layer(), use dentry_path_raw() for detached mounts instead of
> > d_path().  dentry_path_raw() walks the dentry chain independent of moun=
t
> > namespace and returns the correct fs-relative path.  The path is
> > display-only; the actual layer_path used for mounting is always correct=
.
>
> I think that's nonsensical you might end up with complete garbage. We
> should think about a custom format so userspace can "label" the file
> descriptors instead? Amir?

I wouldn't bother with that.

I posted a patch (you will see it soon...) to fix the test:
https://lore.kernel.org/linux-fsdevel/20261017165103.2450042-1-amir73il@gma=
il.com/

"/" is an established fdinfo path for a "disconnected path" so I can live
with the existing code as is.

We could also label those paths as empty path "" to make sure that nobody
tries to replay those bogus mount options from mountinfo, but really I am
not sure it is worth the effort, considering that it is very easy to
see mountinfo
with paths that are useless for replay (e.g.
upperdir=3Du,workdir=3Dw,lowerdir=3Dl1:l2)

Thanks,
Amir.
