Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C6327BEC
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 21:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774472976; cv=pass; b=pMs95fbcxWilVOzsBkdOJU9hUrXgnDW1NO9N/q+pyJ+6BKTCmR577Mw99IMvK1s/4NRy9tlPa5VYb1xmShvq42xNw16QrccV6I0d/uctRuQBTxyVvTn6zLjUq4iKvvtDYMCawJOTMXWDklWnfcWe+86tooO39A0pHUaaxWAIjEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774472976; c=relaxed/simple;
	bh=+VhIqM8zGhc+m76yKiaO60y31unY6JeTZ44Jk2qvOic=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5WjmYfXVmU/rMxVBj6p74bZRuoJyUvpPlIMN1kw67q9+0Lllo+QoO13R6BeGAULK08tpDErcUiMMgJwW5p6Uu5HdjOpi3e40rtQ3OjUbJvRL6Q71c9E42ICsMbUnwWr25lCnhZi+pMs8uczSVhoR8L/C6CaDt4XgLEfxQ3LiAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=kibyR7wr; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="kibyR7wr"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9358dd7f79so48924666b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 14:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774472974; cv=none;
        d=google.com; s=arc-20240605;
        b=gcIb8ooYB+fS9BboVexO1wzD/m02XeGO7NexUWytCU52jUBJXPP0bIZxdkTAo7hnev
         FIkVMTWlGzrCqcLEc1hkZLc18OBPfiStKNXzX+oUoTa84i2CzhQ9Ba4oHu9uvoPyQC86
         4m5W59alCTevsfLWUck/ZBIMd3o27i5ASAvlXBXJLrjwY8ziPtKPI6NEJAz3Ru0SWbpi
         SaGnaQ1a78LWgXxUk8t5wl5MFUaDIMsBmxo6KKU083LHoxAj37z9WLFssjjVA2+/v0DT
         d3R1kyw7AyWnCcfjDm1ZOUig+GBTX/g/Yu4CFrSlZmnSu02VIpA9lz2sdhFR0rWZr4gk
         YMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+VhIqM8zGhc+m76yKiaO60y31unY6JeTZ44Jk2qvOic=;
        fh=u/14KznpFgbedvXCEMkZb3RwNZXa3DJ75ZDsZW4MKQY=;
        b=EdIeW/pEaJtWDUXlF9APBQne6mBPM4tyg9cbv4mlnYE3JpiBYsHjHnE/RL1poLlkIm
         sgfuYhJMK9vrz9/7SPgcY35B5XtVE47wvOmtVM4dWWTG9rmh6I2quX5RIfaWX/TMy3rx
         2CdhQyZ8CAciVxNy1jBoxk/qpXYmboUTqA3E2MFIkn+ZcDW4/jXomX9y5ZqhMPcfz4aR
         3ULHa9z3cBApG6vDPXCSRY2henje/WkB9+mxFEYNDbQH4+s442Zcn8LeaEuR0+IrlCGY
         0XUoOMfgA0+0iL2ep878ke03qNqUOfaH1KIqDGgx2TxQl7rIrT+yYbrjLxN2MF+x5gmi
         nLTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1774472974; x=1775077774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VhIqM8zGhc+m76yKiaO60y31unY6JeTZ44Jk2qvOic=;
        b=kibyR7wrY4Ry8bBxtEFc1HurmowNL4f6/p1vJk+EgWWhjli1plY+3P3VpnWnrh4bdT
         nXJIhoDKZwarbkuq02aM2QLfS+cUYMQIJeRd4PhRKIuXHXD3VsxREP4NBu66agcrCtB8
         OO6olyiEXpqHn6sfT2fFdyAprscul95sq+EBsD+uUofi0ttcaWuoaE597I1pi+A0zE4l
         YS1bISo0z/4ANyqG9n7Z3RGzwkCEKgYJ/n2S0VSsp+IYUl9vrsNL7jhwzKb9VysSMcuu
         PtkMweI2vib6UHcVccibBJUO+VLYaVjB6NORXAoVxLwABtH14HDoVlvp8YuUbx4mwvRQ
         6lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774472974; x=1775077774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+VhIqM8zGhc+m76yKiaO60y31unY6JeTZ44Jk2qvOic=;
        b=UzfroMwhTu3iHj6QaxmW5bl+e9/pJCKnQf+jJCIuRc6kD9IzBIatJc3DFLJ5ShTzTR
         3DBJGRFuBpWLoqVe63B+iA+pHa8zRI/CvU+rB7OKWAQqfOdqOmeXY/jxeFICcqxIoGbn
         +fy35RlAuBgJLSMWm4WWzxTsaiuiYWX2KIbGJJlO3A8mvCe/6/p0Mo5mIlUCnp8ArEfB
         13b2KEGa3T/jlLo3mE90H+lNAuWWqFgik2cpOvAMgFHGEmwwlevBs9ZoguzECLq3BDnt
         X5jVEZhKf2xXxhDplLHF7qYlhTCd4J0uTDs7nvRJ++Equ2XpYdl+TIvF0tdIj8eNhuOK
         vtNA==
X-Forwarded-Encrypted: i=1; AJvYcCUJxv2UaQxxzJvavaLLI/KQGgEwGl2rlgKWXGROmHbo4yfiUInw4ZHQfHd+5JABlDJgtngmGwihJFgutjoOGsY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY6Wqq52+4EpnSs/SwatU90Q2v9+cvyUdhxCuHfpYfZej7UzPf
	FknnsUmIV7F4xO8zLz2cO2VhZEn7pfnDoXT+qu0tkFEQpYOczaek1RK2AwEs6MQ+LrYA0zAt1OH
	lHtH1iwULaHf3CpJo0txMNmmQBV67s+Rs0wFNIFM6Dg==
X-Gm-Gg: ATEYQzykvtZQ8qG5QQBWMmj9u9cHw83PHspFxr1ZqGhD58chipAOJSHHfZiJzFAXlWT
	u8mn5NdJxv5NvFpjZz43NXOP0EAVVQFYt9DPt79zU03IW1c9YNwJ8K8ddqCssPuAslKlOr7xedn
	6s1haRnJ2WFhI2IYktqtnDYeAJGA4t8YajoKUePPUZSBEdVQhU579TvWfyWBJP0kZ41hVcGGH03
	bhRqVfRTxwvZMn4jnpPQ5MByg0Dv/X9DALxGQkXy3cVNd8mLq+4Z5GSD+tjJ+yGMRBZfUPFpZf5
	EqFdkzJX57PKqzCGzIgVr3BXjwClUPMhCNnTgQ==
X-Received: by 2002:a17:907:806:b0:b96:dec7:5209 with SMTP id
 a640c23a62f3a-b9a3f1a00b7mr371393666b.17.1774472973704; Wed, 25 Mar 2026
 14:09:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325182026.467307-1-pasha.tatashin@soleen.com>
 <20260325182026.467307-2-pasha.tatashin@soleen.com> <2vxzikajacgc.fsf@kernel.org>
 <CALzav=eybgJwMQEtvSi2bUv8u7cic6d45r4wFZdZiKFFrrLJfQ@mail.gmail.com>
In-Reply-To: <CALzav=eybgJwMQEtvSi2bUv8u7cic6d45r4wFZdZiKFFrrLJfQ@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 25 Mar 2026 17:08:57 -0400
X-Gm-Features: AQROBzAuEXVQtKItis6pRa3obLju-DQMgEMDY80SPeEiiuzBk0dpu4-udbGQyUk
Message-ID: <CA+CK2bBpa8ZnxPdsPCRCAiPeHUbqQ3TNjHTGU2eN_BGqqX2Y1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] liveupdate: prevent double management of files
To: David Matlack <dmatlack@google.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, linux-kselftest@vger.kernel.org, rppt@kernel.org, 
	shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, skhawaja@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 4:34=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On Wed, Mar 25, 2026 at 1:20=E2=80=AFPM Pratyush Yadav <pratyush@kernel.o=
rg> wrote:
>
> > For memfd and hugetlb at least, we serialize the _inode_ not the file.
> > The inode has the contents that we care to preserve.
> >
> > So if two FDs point to the same inode, this will break. You can do this
> > by first creating a memfd and then by opening "/proc/self/fd/<fd>". The=
n
> > you would be able to trigger the preservation twice, causing all sorts
> > of problems. Same on the retrieve side.

Hm.

>
> > So unless I am missing something, I don't think this approach will work=
.
> > As much as I hate to suggest it, I think we need to move this check to
> > each caller so they can find out the object they need to serialize and
> > check if it already is.
>
> I think LUO can still enforce that the file is not preserved twice.
> HugeTLB and memfd's preserve() functions just need to also check that
> the associated inode has not already been preserved?

For memfd/hugetlbs the true state is in inode
For vfio/kvm the shared anonymous inode is just a dummy wrapper, and
the true state is in file->private_data.

I wonder if we could use the XArray to track inodes for standard
files, but track the struct file itself for anonymous files (we would
need a new function from FS that allows us to determine if "struct
file" has anonymous inode or not).

Pasha
