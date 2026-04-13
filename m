Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59257399007
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 22:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776119780; cv=pass; b=gQB2jwE1oxavxYtBf+tGx1RGQJwgNAsY00bYoAdPCch5BRX7EqyRrRrWLTn4Z3zB6ipQrSGVIQbZrVh3e08lzek3ybABv9lFf5Go2W2D4SZCUwIPxlbMPBxcr0Yk0MY5dm9ZJU9S2aqgL9TLDi1Oi2sADEfeav/m45lTSyxeRfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776119780; c=relaxed/simple;
	bh=d8vMZ6K308Us1/0IQb4+4Tj0D+uy5+oDNEDVfIfLGOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxQlXcUOt7H4iwpOIraoY052J+L9hyBI4J1qtc6mVHorBvn0/UZqChQrI4vuUs1PhwmLhwbWfUxsWxTZVNDmJI6LY13aFLXCcj3pZiej0gBOiYNp+4Uh8QGbwr63ubFsqBYXHXGtBRc1x/HxPigtrLt/Gamrbp4k1b3JQ28WCAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=fMAgNRYl; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="fMAgNRYl"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c76bde70ec9so1960266a12.2
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 15:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776119779; cv=none;
        d=google.com; s=arc-20240605;
        b=E5lsCBfu1O9p28hzTzS5ERuU467p8OCzNu7ZZXo6ZG4wwFLsWr5FJzr3YnH4DNn1QS
         wi4B4xjHKLdNGImhRAZoSmeWRb59GlDZTkXoKag3pdK/Q33go/W70EA0/1SPGOzb2+Ea
         NkoOxtJIzfYWMAtnHbUot+Toufs445Ozql/RXYwzSt5AertrWgeKKFJNqd7MhinJYoGJ
         3j8wjDpsY2JHbpKBem2RNI+vnso5b33WAH2zS+bh0CykFMGNf+53EYx91KW3KbezvzDY
         2fVAZTmRLaAgTqZC/ExMen/Ky4NRtCks740RX+iz5d/fLLgwQpjwmTdkSmYec9juunUo
         hjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qtbV5B7Lu+P+UBXu1v1nm/SRzL7N0UD8vGEwc1vtats=;
        fh=6SqnY300o3z+c4pKuaRA7sqGyXtW2vfd0AS02j6V09s=;
        b=DKytNQx/Jo68aEOxUa5Es38fgBnn8xfMqyBgWqA0SlLrssrFDP3wQROtof+RJ+NFNW
         fZdCHJNUwWYHaMm5//xFZ5TC/qxC7qqom2viWBReaBvKFsSFLNj+bCHNYWnOYIRFmHp/
         FuyqwKJbn78Y2wqtAjT+h0rxNedQBkxeV4ZbuhkBYWknOA2QWSWt7n3HeLsE5tUgpWYd
         8wSQQ9MALOx1FsS1YHII1Ub3Oxrt/xXlBWhN4hHeBnTh4/OLbQzXHaDmltlBBWzEsegE
         q5Xn/o3wl2vl1iodPyLEWiLPZ/mjObXqszftuY0joyws9nbbhu/E6Cl6Pbzu5fbLJ+W/
         5llQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1776119779; x=1776724579; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtbV5B7Lu+P+UBXu1v1nm/SRzL7N0UD8vGEwc1vtats=;
        b=fMAgNRYlp3Yrd3ZdH5HEQb3NH4f4EXq3nlut5HRXSXQO+wxCFm16+ZTpfIzd/ND/hG
         d6jqlG6TywVJE0MAq90nxLLT/I0VUvHBZFUtk+uwuu3Do4zyHSjzm5mYBF8n3lzUPnvC
         uEZC3oxsj7QxhtbOcItEtAwhnoVya8NkYw0SXVOCc7TwFchKBstK1snppvmjeiYpG4Vr
         X0lI+/tohvyJsyVZFgQD++itBDqZkc/cQDyhLJr+/lez79gcEEi95trc86S32Oy5oME+
         UwZl34OmlOXrUhFsa1ezN6+ofaEdnZ+Lu+t1C1eQV6yM4iGHsJOpfJ96+KsN8nF7eZol
         hL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776119779; x=1776724579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qtbV5B7Lu+P+UBXu1v1nm/SRzL7N0UD8vGEwc1vtats=;
        b=P++p2oEi7tEkrWmgOqGwTcGuBqIFQkff6HUb8evtO7MAWAn5kWiR9THrGbvlkDUZQg
         /38eA1/451iyW6etsJhAJCZEQMTvDc5LjqjahbqshcILsgIXo2MRixXRmNK6OkpNfkzh
         6HH2kaoA4BHR32ItB4evTvOq2dMWozjpifz2W3g482nDdXzBjAmqvSoCqmhBvO2fi7NW
         iyxsQV9egMNKKw0fEgOCmX4FWjrW2f1cwB/5quAo8j4wPIV7K2vfMDFCmVtmjCBmGLXj
         agsxFpomJ1l/PI7azJOV4ocoJKH1zo+40ADe2rUtb6TZjfmBNuvO9zcm949YYGozWYtp
         v7ng==
X-Forwarded-Encrypted: i=1; AFNElJ8+ZnQm0nusLy0LmXKL28N9abSO+Job7g9aC1RMY0LsuzxTMdWTzAWA+cxj0Sr/SxQkcL28GLaauFfTEx0Th4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT1bmstGKaP45FxCxsTX54jeYLIf5Ak1uIfvoPQqS4AtbNE8qv
	CuV10KPs30Tq1YaDQp0mOxeEEg1Qubx0M7/K34gyLEre28e0wvUFXzTqcjrKizph54FgnJ1dyv0
	Cxu+vf4Te91CYIpXQzrgYGpQ62wnDMiMaAUeLKVlg
X-Gm-Gg: AeBDiesk9jMnYdqrEi9to9ixqfM1APDFx643rIo9eOrxRi/8MatoS8oL8J01VFEcN+r
	aOAl0oKFpGtstsWfpxSCKRCE1t16nzIL1Sl8ou2RarDs8D650wLlgByCcCOUam5d0xT1cP5U0Ij
	9IheJ490WdPOkOhSEl+lWnQ0yeJi0VNt0ym0GJXjd4A7dx+hmt692e9tEyANiwshh5+sP025WWL
	eDkBSge+lHHNKDDmBnKE3CWZ5PEt6z85jckodpIDt7gmWhH8DfaAuv7dC2/eugtNqb4fvCKu1st
	m9Yjetk=
X-Received: by 2002:a05:6a20:7486:b0:398:9bf9:7d6a with SMTP id
 adf61e73a8af0-39fe3f51d5cmr16064116637.38.1776119778634; Mon, 13 Apr 2026
 15:36:18 -0700 (PDT)
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
 <20260413164220.GP3694781@ziepe.ca>
In-Reply-To: <20260413164220.GP3694781@ziepe.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 13 Apr 2026 18:36:06 -0400
X-Gm-Features: AQROBzCpXDxX7fahVQKtrKxvxE3JbcFeRuTT_Qi2M1jo4CF48jegNZMVkpYlsoc
Message-ID: <CAHC9VhR1Uke9P==CELKavBcogHoNCtMZFfNWUbgm5HYUfomhtw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Firmware LSM hook
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Leon Romanovsky <leon@kernel.org>, Roberto Sassu <roberto.sassu@huaweicloud.com>, 
	KP Singh <kpsingh@kernel.org>, Matt Bobrowski <mattbobrowski@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Itay Avraham <itayavr@nvidia.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Chiara Meiohas <cmeiohas@nvidia.com>, 
	Maher Sanalla <msanalla@nvidia.com>, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 12:42=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
> On Sun, Apr 12, 2026 at 09:38:35PM -0400, Paul Moore wrote:
> > > We are not limited to LSM solution, the goal is to intercept commands
> > > which are submitted to the FW and "security" bucket sounded right to =
us.
> >
> > Yes, it does sound "security relevant", but without a well defined
> > interface/format it is going to be difficult to write a generic LSM to
> > have any level of granularity beyond a basic "load firmware"
> > permission.
>
> I think to step back a bit, what this is trying to achieve is very
> similar to the iptables fwmark/secmark scheme.

Points for thinking outside the box a bit, but from what I've seen
thus far, it differs from secmark in a few important areas.  The
secmark concept relies on the admin to configure the network stack to
apply secmark labels to network traffic as it flows through the
system, the LSM then applies security policy to these packets based on
their label.  The firmware LSM hooks, at least as I currently
understand them, rely on the LSM hook callback to parse the firmware
op/request and apply a security policy to the request.

We've already talked about the first issue, parsing the request, and
my suggestion was to make the LSM hook call from within the firmware
(the firmware must have some way to call into the kernel/driver code,
no?) so that only the firmware would need to parse the request.  If we
wanted to adopt a secmark-esque approach, one could develop a second
parsing mechanism that would be responsible for assigning a LSM label
to the request, and then pass the firmware request to the LSM, but I
do worry a bit about the added complexity associated with keeping the
parser sync'd with the driver/fw.

However, even if we solve the parsing problem, I worry we have
another, closely related issue, of having to categorize all of the
past, present, and future firmware requests into a set of LSM specific
actions.  The past and present requests are just a matter of code,
that isn't too worrying, but what do we do about unknown future
requests?  Beyond simply encoding the request into a operation
token/enum/int, what additional information beyond the action type
would a LSM need to know to apply a security policy?  Would it be
reasonable to blindly allow or reject unknown requests?  If so, what
would break?

> ... Once classified we want this to work with more than SELinux
> only, we have a particular interest in the eBPF LSM.

One of the design requirements for the LSM framework is that it
provides an abstraction layer between the kernel and the underlying
security mechanisms implemented by the various LSMs.  Some operations
will always fall outside the scope of individual LSMs due to their
nature, but as a general rule we try to ensure that LSM hooks are
useful across multiple LSMs.

> Following the fwmark example, if there was some programmable in-kernel
> function to convert the cmd into a SELinux label would we be able to
> enable SELinux following the SECMARK design?

As Casey already mentioned, any sort of classifier would need to be
able to support multiple LSMs.  The only example that comes to mind at
the moment is the NetLabel mechanism which translates between
on-the-wire CIPSO and CALIPSO labels and multiple LSMs (Smack and
SELinux currently).

> Would there be an objection if that in-kernel function was using a
> system-wide eBPF uploaded with some fwctl uAPI?

We'd obviously need to see patches, but there is precedent in
separating labeling from enforcement.  We've discussed SecMark and
NetLabel in the networking space, but technically, the VFS/filesystem
xattr implementations could also be considered as a labeling mechanism
outside of the LSM.

> Finally, would there be an objection to enabling the same function in
> eBPF by feeding it the entire command and have it classify and make a
> security decision in a single eBPF program?

Keeping in mind that from an LSM perspective we need to support
multiple implementations, both in terms of language mechanics (eBPF,
Rust, C) and security philosophies (Smack, SELinux, AppArmor, etc.),
so it would be very unlikely that we would want a specific shortcut or
mechanism that would only work for one language or philosophy.

> Is there some other way to enable eBPF?

If one develops a workable LSM hook then I see no reason why one
couldn't write a BPF LSM to use that hook; that's what we do today.

> I see eBPF doesn't interwork with SECMARK today so there isn't a ready ex=
ample?

I'm not aware of anyone ever doing to work to try/enable secmark with
BPF, but I see no reason why someone couldn't work on that.  Just make
sure to take into account Casey's comments about multiple LSM support;
any new LSM interfaces will need to support multiple simultaneous LSMs
(the original secmark work predated that).

However, it seems like direct reuse of secmark isn't what is needed,
or even wanted, you were just using that as an example of separating
labeling from enforcement, yes?

--=20
paul-moore.com
