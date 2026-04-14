Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBFF2940D
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 19:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776193804; cv=pass; b=L4+rG+A0I7NlU648I+3XiGBtsx/u5J0ev8CKsXZiBhfdETKp1et63FgqzSE4Xr4mSunNG2P5YJXAyMJiy8klHOnh3C07OTE1sTQv5hFDvPC4J+t4xo/eeB2Hpa+6784SJ6xz5dlBtt1Syj97c+raf5IXQ00PlNzBTz+VJAohkDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776193804; c=relaxed/simple;
	bh=J43mBV0ldP+9tAKtYP6opL+oCOolAXGommPsCXcYceI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NB6G+9wDnGRc0mENn0PLHAdEyPTINJVErZDvZm/l4e9x5Rq33ekvgNZUQLNH/4PDTnhlAhWvKKkRjD2nsvs55YAqhcTGwCIo3ZC+bTIu/YQ0/bfJO5+BFqZkOFkvAC/6aeNSpKRs0CNdnKRc0uGmSzmSQDoZKc7V4M7BpLnKoow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=ExZHjmi9; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="ExZHjmi9"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso5109182a91.3
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 12:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776193803; cv=none;
        d=google.com; s=arc-20240605;
        b=lXvvzqVnxqvVqips6RMxPi1VUjIuPaUMPGqzoxWi+/G45ohSIEryjlr788ZKW5Fu+q
         LNNkLe+abl/KOgKl3hRdDJc5VK6TMq95OYMF+qBChUGkBHPckDCSpoujOiplv3BlHTt+
         rTU3od2Y6KdSD36GsYBw48HZbJNkqIyg7xWM1fOaIOOdmnyrjCOZcFKPcqaN5lXyxXCC
         m1WkbD0WtQ06w9rOrOzVfnFOXNqD7BQzSuebbcq+RJN3IdicJy5i3udFuiwtdZxgkOvq
         98rbwOpDCL+OumFRWtR8GUbh22ZkMJeRVRU/ki0JpxykZOBMo6XEzTdeL3djSM2Xv71d
         5U/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RMeIDL2hZeivdhvp3qRRH2W8sXvQUhY/bjEclVKtEJU=;
        fh=CmeXz6GvAuI+xATpRb1kEEr7+kAEiFIIhfh02B38hTk=;
        b=PpI76UVDaPn/VHUvYAPMJIUNEn/1f02pyPuCvsz3/heVXpNRQJGIKWmjXpyixSi+Z0
         ajHQVq+rJs+b3K73eGrcVxsyCuCE4I33zC2VFngPWFIBJ1lkO4ICpDZhcB/zPBZ187k+
         HqAV8jOyRoeMVnX8FrcoSTikCOCrxMwkfd0PfcLvkQ0PoJTUrA72qWf/CJm2GNB87T6p
         tv5ZbXgtPMeCk8+BRNgs0Tu5H/3VfXiIQToy9pstxOqbxNvK0zll8uatuWX5QdopD/Jg
         USJ/c1Z/2Y59uiZbNLsBHO7jZIdEe4GnRtmVnzAVVa5tZ35WxlLQvL79gIUTM4DDGBTt
         oOHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1776193803; x=1776798603; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMeIDL2hZeivdhvp3qRRH2W8sXvQUhY/bjEclVKtEJU=;
        b=ExZHjmi9lX9IqrT94HSUjWeI+fXtJcBXvwhEUc/+YY1xv8Rv+ImpKzcGEI0+GsJBIn
         cA9NXcrOzvSiojvwNGbX4DK0jsZuUP2ZcTj2ThU7Oe2DaRgIfdHwYS9MXrJ1ZSCBWAl4
         9PWauySv/so0TigMhbI/ZYT/joSLVF7peyMkEwEyT6bnq0r3KAjl//lsqY8P/l133QdX
         lwu36VEXaz4oK1WI66BvS16iEBKYoqclgb09tDV1+tu1/xOHFS7v1xF+E9HBYKEPjZ7l
         bikZWPv5Hg4OWpUONFrk6gfHgZeYgy6QaTgj3dgNi8EGhI4SDiaadQzqHtHb9yINVb/F
         ZnPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776193803; x=1776798603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RMeIDL2hZeivdhvp3qRRH2W8sXvQUhY/bjEclVKtEJU=;
        b=RYHPaon9MzL8gm9dTPAA5JrrhGxWTs39N7hLPyR3Pn6AsAUobSpsp+/shK6XGjryFi
         BdsIGEJ/hV5O1FbCtiSk2E6J0RQHFaFGn4TpeU2e6vFKBZTxFuPsRub5GwJAvHCyT3jA
         17F3XoJy/2dSWTtgvgJFGhKSYJ0USGExM19usjgwUlB2jmZPBVOs5zU+recIJFxpmdmh
         SsHOlh3dHw3ywYiwxuudJPCDIkEGMTAqokgCZ0oBBqa7652LA/DN23bKBkobtYODZyMT
         mxtdtOqxbwNDCVtFMJmTZwZX86Tozjd5gyWXmt92NPhVK4wghHOYq0PtY8dpJwU6ZTC5
         klZw==
X-Forwarded-Encrypted: i=1; AFNElJ9TnmuLnOQ4GMtQN+MF7JLTXg+mfV8fdtJUuLhENOtX1rA3lXUc+AFpzVt5CWPPD4mq7cW5LXK5iaxFXXh3y2U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPxfhYuAibo59QLFz8RbF+ooprCCzw/sxeXe2onRiw9gKWSo6I
	E6PwV9azGF3RBnnEGBWa0Bp9nqMfW5cQV2mAST9m9e9lvJOKY7IPVTVIFU36QFhXXNPe8y5MQLF
	331NbEy8x9GnxSLjnh0C7gkFmLSkfxGDz0wVhjSuR
X-Gm-Gg: AeBDievyKwEZr2/dSqNmxKmcDMFV7Ro/Z1GMt9uS9uNEMJdvlH3MX0JqSmyOM+f1D98
	7/cXGS5dVEVA5FvGqydIUusgWoqn/aEfbqSBaVRlOjXqWIJCQLG2/zaQxDUTATzMM5+NrL1VJuF
	Js/iEAHoG5hIjtoEwbEkc+P5rC3nqQpV1vM/Qt8EiSyzBoQ9fEi9ddhrasSyk38DUzjI+BmP+Zv
	/Zt+GcOzkDTsICRCYmxWKFVp5leMcc9XXkBRFLuelwxrjQd2Skn/kGKvDhRKWI0M0NQ5NlpMM37
	TFXbC/U=
X-Received: by 2002:a05:6300:615:20b0:3a0:cd5:82b7 with SMTP id
 adf61e73a8af0-3a00cd5a76bmr10180913637.55.1776193802297; Tue, 14 Apr 2026
 12:10:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-fw-lsm-hook-v2-0-78504703df1f@nvidia.com>
 <20260409121230.GA720371@unreal> <2dd138a2ae87f90c55dbc3178d9c798294fd4450.camel@huaweicloud.com>
 <20260409124553.GB720371@unreal> <CAHC9VhT1X4HX4bGrK=mEzu=g=mZ-Wg-LDXVgZVe-e6oM+W9aHg@mail.gmail.com>
 <20260412090006.GA21470@unreal> <CAHC9VhRnYXjg+vE9a8PeykbXk91is12zYLaO7EFdfZPKMxDfPA@mail.gmail.com>
 <20260413164220.GP3694781@ziepe.ca> <CAHC9VhR1Uke9P==CELKavBcogHoNCtMZFfNWUbgm5HYUfomhtw@mail.gmail.com>
 <20260413231920.GS3694781@ziepe.ca> <4cf6b20b-f53b-4b5e-ba03-c7ac01bec0c2@schaufler-ca.com>
In-Reply-To: <4cf6b20b-f53b-4b5e-ba03-c7ac01bec0c2@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 14 Apr 2026 15:09:49 -0400
X-Gm-Features: AQROBzAOdBY4w7LZBBBsHqiX9-ECTPgm0KJFmDB-WN8NELm_4E3dGLmVNUhIl-4
Message-ID: <CAHC9VhTm9MG-NzdwxtqJA6LZeTEsmUjyy8da2=8KOVxgDtEqWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Firmware LSM hook
To: Casey Schaufler <casey@schaufler-ca.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Itay Avraham <itayavr@nvidia.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Chiara Meiohas <cmeiohas@nvidia.com>, 
	Maher Sanalla <msanalla@nvidia.com>, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 1:05=E2=80=AFPM Casey Schaufler <casey@schaufler-ca=
.com> wrote:
>
> Netlabel has a similar issue to secmarks with its use of secids, and
> currently supports only a single CIPSO tag in the IP header, making
> multiple concurrent LSM support impossible.

That's not correct.

We've talked about this multiple times Casey.  The short version is
that while NetLabel doesn't support multiple simultaneous LSMs at the
moment (mostly due to an issue with outbound traffic), this is not due
to some inherent limitation, it is due to the fact that it wasn't
needed when NetLabel was created, and no one has done the (relatively
minor) work to add support since then.

For those of you who are interested in a more detailed explanation,
here ya go ...

NetLabel passes security attributes between itself and various LSMs
through the netlbl_lsm_secattr struct.  The netlbl_lsm_secattr struct
is an abstraction not only for the underlying labeling protocols, e.g.
CIPSO and CALIPSO, but also for the LSMs.  Multiple LSMs call into
NetLabel for the same inbound packet using netlbl_skbuff_getattr() and
then translate the attributes into their own label representation.

Outbound traffic is a bit more complicated as it involves changing the
state of either a sock, via netlbl_sock_setattr(), or a packet, via
netlbl_skbuff_setattr(), but in both cases we are once again dealing
with netlbl_lsm_secattr struct, not a LSM specific label.  Since the
underlying labeling protocol is configured within the NetLabel
subsystem and outside the individual LSMs, there is no worry about
different LSMs requesting different protocol configurations (that is a
separate system/network management issue). The only concern is that
the on-the-wire representation is the same for each LSM that is using
NetLabel based labeling.  While some additional work would be
required, it shouldn't be that hard to add NetLabel/protocol code to
ensure the protocol specific labels are the same, and reject/drop the
packet if not.

Use of the NetLabel translation cache, e.g. netlbl_cache_add(), would
require some additional work to convert over to a lsm_prop instead of
a u32/secid, but if you look at the caching code that should be
trivial.  It might be as simple as adding a lsm_prop to the
netlbl_lsm_secattr::attr struct since the cache stores a full secattr
and not just a u32/secid.

--=20
paul-moore.com
