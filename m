Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58670390C89
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 21:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474550; cv=pass; b=QQ2jydxGB3yz7MDuz9+SX5y3xRw09vwU4YlEr6HzkdqDXHYlmpTLoysuMjd45r+gOCykldv3Z7gYlm/PgDn6hllF99RPcCRIyYcO2ctbkYJZDrPFYcNV6tru5Y82rFk3LvoQVJByigJa65ja1fjZC8jkHCAx/qpOfVIXRLZhnWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474550; c=relaxed/simple;
	bh=VqwP9g0v6C0mDQ30HJRspUgVjqd11IZmGYop0w3266E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lxiuQRmiQWt2pMBRdJuSeDUgnaBVggTpcasn8UCi/t1Ui9Bjwflqao+EV+7KVk3+37gjlNYHCbdMYYMSLZ2OPQe2nCt7zaU4Qyw9BeY82ls+vWhWQ/LLCEeOpUVkXyAKaBq/CiB0CpDwG1JP1dLV7ZPEG0Ug1RP/Op7Twg1FTFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=g+CWZrAz; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="g+CWZrAz"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66abcbae8a2so476107a12.3
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 14:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774474548; cv=none;
        d=google.com; s=arc-20240605;
        b=TMO4lMzyUF4X1UJamSvItdxDPjsUw5wsM6nnGjSa9DA+Nvmh39BqaegqGUQftMLDLl
         ogGAT2xNVv404a6BmsMWAR2+emPLi53r4O3A38gsan6/5lKnBFUm8iT/SGy8dCGEOgx3
         Uvt+KjRy393PPAlWBJXDLe5eCKLSQH22uWHKxmBjmQgMDbbbyuMqFnpZ2BzU6nY5CUxx
         kWdkPdsQdnm9hM0fuye5uVEERYO0pXI3FcqPT2PxUbG2PMpE0Vju4sgVEWfiojKjySw/
         Ccij8cvW58ofbTBJa+jn9TsUKMjXM8hImqIaFgGpdcsrln+IgkRIJtI9fw80jC4RLEcb
         +0Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VqwP9g0v6C0mDQ30HJRspUgVjqd11IZmGYop0w3266E=;
        fh=HJrivvYVKR2MLpZtHDFjDTbf70bnjK6hZGqX7vmOs1o=;
        b=blmGZTznhFosHEF6CRqo7B0hksBsyYL6pgJh9+3lWAXJbNaQ++nE088D3dLysm+e8s
         7+HPREdASKK55A5BbeEPpzIG60bvUnkNd2zuj06jRKn07yum2a/Cma3Jx4xvMccZ/mLe
         PhlN9rVEhxa/0aU4UBT36gxxgoIHrThEWoho5WMpCfmCQkdIYJjsfm9UrTxU5sPkhlwq
         yBoQzJM1KftfGZmLi+TwbreVCBQHDJkEsVnJ9XyWXGf5ixFXWrGBwiFnEVjLFgtwR06M
         uxxQqLh4mjegasWR/3ajBKhxDsXoGZBNdWpJ6BnMZeQoX1KX1dTRuRlJcRv8OaawzQfu
         MO/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774474548; x=1775079348; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VqwP9g0v6C0mDQ30HJRspUgVjqd11IZmGYop0w3266E=;
        b=g+CWZrAztitE7NzllWWgxNa9nZavcBFdswuBWTzRuqEcZEJzKXWW4QCumlqFm8RWgd
         nGL0Ldu7Z6Lm6DxwPabduBlnE+JMmrwGw6FC0inx1YS6EIwszOZzm77lYO00nIYZanHQ
         yGtxLELqYkEat+Nxmoby7d/Vi+AUi48LJJ+TktUqjoanfiGB6JevvqR9auXV00WfpYwv
         5EoBJyXxBBjKRfKQD+A+JDfqzYuDPxoy25dA/OYk7ZczoPHg8bJqJ3QfA4BjrAiVPowX
         U7gjF3hrtkbYhN/zfz6QsRr7un56tHAB2e7OaZa0jTJYPjRWLE+FgMo+qGF2AFv2A8ux
         mh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774474548; x=1775079348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VqwP9g0v6C0mDQ30HJRspUgVjqd11IZmGYop0w3266E=;
        b=E0AqMxqz/LOZPjhvISNq/Q+6rGj2E5TrqwRdzWR/F2OPqqpds8NpzOYo1Md2DOCslE
         IxxUJrEH8mlBaEWnv+yxbykFLlYFwQVi759Rp1hSm7h+bXEnt5AkTwC8Lygsf/yved2U
         euNP9tUsClOa4ZfvU2cUUsTU4oSDjx6DQOR+gmEEa0TsWCJeSpqrPt9QGvZeJwBk0SrI
         i0j6lLk3sjrSmbJSJFqiFW5jvqvSOFDgLqvdmK3eqh/IRrMJWt6CYZ2EqlssSDZiGsIC
         gJduQzwvsVD+QklEKOUykE/biCBKC8cpJi+TgGRbCaKa2ZVON3NYbhTFHQ9DMkVWKnMg
         UHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQgeqFBJo6bsTt+vwn6wySjyEnZOz2cY5yWwjxOvEQ8TDuFDEHCat3L1FwQ4wIOsatqHkaHCD7C1l/s6ORvEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzEmXmtYwPiMRt16+0enrqTj+VLSh+DPlRInMZgNB/9eYnApUT
	aSBjChq4ourvnjYEe/9hILE4swkHcq7CLlNzEk6k44CKV+807cgK7sJV2IWBlPq1ocnrdBnEJYJ
	T7dy4t3K8tdEq90dwcwkAjP5DraVZClZECp5kuYWI/g==
X-Gm-Gg: ATEYQzyBEFz9VnEQl0whgONewo/HJFopSHvcnZp6R+gD03sKm8Aqf+BXVObrZTbD3y7
	J9zOU+9TrgG0xlIAKSLnpQf6hlNFVztyvAYQS+8H59VLmVkkNHgC1Fj9N6jo2JpQM/SHczWSerR
	TrCGEulNz9M+c1QY+a/IqGSDK+L+G9qlpW40U6RY2ZzvExZSbKUmR1wIB836f8lnxF8QkqFHX9/
	/Gl6njhqQ2rMs0en98sjc1msmUj6/pqQDMZGwSrkXmGfoPermzmNZQCaZvRHZkSag7IH/0mCStA
	xmM+b5oVrCFTdqYp7OMJ9BAa1RiWTIqmq6PSOQ==
X-Received: by 2002:a05:6402:5054:b0:669:4aad:6338 with SMTP id
 4fb4d7f45d1cf-66a82634580mr3223285a12.8.1774474547200; Wed, 25 Mar 2026
 14:35:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325182026.467307-1-pasha.tatashin@soleen.com>
 <20260325182026.467307-2-pasha.tatashin@soleen.com> <2vxzikajacgc.fsf@kernel.org>
 <CALzav=eybgJwMQEtvSi2bUv8u7cic6d45r4wFZdZiKFFrrLJfQ@mail.gmail.com> <CA+CK2bBpa8ZnxPdsPCRCAiPeHUbqQ3TNjHTGU2eN_BGqqX2Y1Q@mail.gmail.com>
In-Reply-To: <CA+CK2bBpa8ZnxPdsPCRCAiPeHUbqQ3TNjHTGU2eN_BGqqX2Y1Q@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 25 Mar 2026 17:35:10 -0400
X-Gm-Features: AQROBzD_QnuinvR0by2hrqTHXqilLDpZUMWt-WEZYStEDPZAUyluZXMIeXkLNnM
Message-ID: <CA+CK2bASPq0_4tDGaqd_mEmF-Wvw4cfS40bC4p8XWR4joY-ypQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] liveupdate: prevent double management of files
To: David Matlack <dmatlack@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, linux-kselftest@vger.kernel.org, rppt@kernel.org, 
	shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, skhawaja@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 5:08=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Wed, Mar 25, 2026 at 4:34=E2=80=AFPM David Matlack <dmatlack@google.co=
m> wrote:
> >
> > On Wed, Mar 25, 2026 at 1:20=E2=80=AFPM Pratyush Yadav <pratyush@kernel=
.org> wrote:
> >
> > > For memfd and hugetlb at least, we serialize the _inode_ not the file=
.
> > > The inode has the contents that we care to preserve.
> > >
> > > So if two FDs point to the same inode, this will break. You can do th=
is
> > > by first creating a memfd and then by opening "/proc/self/fd/<fd>". T=
hen
> > > you would be able to trigger the preservation twice, causing all sort=
s
> > > of problems. Same on the retrieve side.
>
> Hm.
>
> >
> > > So unless I am missing something, I don't think this approach will wo=
rk.
> > > As much as I hate to suggest it, I think we need to move this check t=
o
> > > each caller so they can find out the object they need to serialize an=
d
> > > check if it already is.
> >
> > I think LUO can still enforce that the file is not preserved twice.
> > HugeTLB and memfd's preserve() functions just need to also check that
> > the associated inode has not already been preserved?
>
> For memfd/hugetlbs the true state is in inode
> For vfio/kvm the shared anonymous inode is just a dummy wrapper, and
> the true state is in file->private_data.
>
> I wonder if we could use the XArray to track inodes for standard
> files, but track the struct file itself for anonymous files (we would
> need a new function from FS that allows us to determine if "struct
> file" has anonymous inode or not).

Actually, let's not modify the fs layer, instead, add an optional
get_id(struct file *file) callback to the luo file handler (struct
liveupdate_file_ops). This would return a unique deduplication key.
For example, the memfd callback would return (unsigned
long)file->f_inode. If get_id() is not implemented for a given
handler, the LUO would default to using the struct file pointer
directly

>
> Pasha
