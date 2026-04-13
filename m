Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9ED41F7569
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Apr 2026 01:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776044330; cv=pass; b=ShG7kWplZ0W3yBIHaIQb+twH5Fhdier5Irp4QWvqfkTTuIdNdWFDQY54w0oiY6QPkb+x2aUqB6T8vuNxN47KehUBUONVcgyK7/ZhQEax1gB+hynF/XvCoGbQa7LwGK4XLbwSPmI8vWJmNoA7lkT4Jquf/9mHmhRNGgIDHN08jo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776044330; c=relaxed/simple;
	bh=nFQMxFVF63QIAvOySvI+1iQgD3HbEkVh9BhKaGfv3zE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dg5DetXYpwDERtGPgKBcteVfcnfT5XQ8Cb8B+UJSvrVGztyUOUJ9kMZw47pTvpRvWSqYGPEtpd2h6M6jUK4tioAo9hVyxq8NQJfTiPYltLytaqgqfvtzjHHMRJc1G1Jgztm+j8a5nOyivPIaTuvQR6Nn2ogofLQZjp9yEVm2Oks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=eKE915kT; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="eKE915kT"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so2183373a91.3
        for <linux-kselftest@vger.kernel.org>; Sun, 12 Apr 2026 18:38:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776044328; cv=none;
        d=google.com; s=arc-20240605;
        b=i1raQ2Et5+BpF94Yox4wrjrG8dLGVUmyvucyW2DgLT/M8PcFBQdHp0N7/dPTtSbZKc
         dvdULo6vfeFMe/bRHb10HUS4no+ZWV5EA91/K0JJlbzpzRM4EbjMDlf/kGUzNS6IiQ/w
         WisokS4q5sAGRSJpgFLdTR6cEjZoboMwm6MVurpkCGGuDjGEmOx2YR88dqp9I0IEk8Ax
         FurKZkY0CNrQ7jnfp4ihlde8ok6rInMJ961WKJnIJ/u7A9//gKakWkY1XFd5lWN3Sk59
         iXvN08an4dXVRA22twcv2xptRDP186GEEa+vAo0FscxVlhalMpvNj+F1hitVLA5vBsIi
         ueVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rHM3YXF7LUUih11DEyeSF4HP2j8S81Um3Rlg3lvVGk8=;
        fh=udRV8CvZ7ec/6wy8aXzC8AH2yXdcWARj/JYQ9tOorQ0=;
        b=LmIKydnjJdsOfEqdAXyRDPFzmOjgQ2SDhYu8S/cuCCSPkdj0ODlVH1rgLIBzgykTl4
         r5lbebH4gEV4uPcxFR+E7XiCK37qDaHcFNox/fSZqjhU3U0ngubfEUfl/Z+A6bndnplv
         XYg6h9n0Czhn3Q11OXlVmjkMNjPKx6qaKeSfODBuk3xNfns/bP/Qf1fnot4O1Up/q25f
         Ih3Xt+buaNSqZ8L2EUDxHpE8qiTYJWAoZx1UrNHyuAFYujciGDgSDHacABYaBWXWLf2s
         PClQfsC9IhwxKTWGbdzEqbLiWt7QLXw+wuyTkQjwXOS1yq5Bc4JO+Yt+wH/VyTve5b+P
         wUdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1776044328; x=1776649128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHM3YXF7LUUih11DEyeSF4HP2j8S81Um3Rlg3lvVGk8=;
        b=eKE915kT3+S+mLQpSv3WJJllJZL/rf+5tW81dTt/VcQBQmgXELrog27o4zy4CEjsoU
         +v3RHtxTvZeZt2a9GAo4Qmr626+pPtGF3BOBmSlcJ8ZBDxC8LM7kCyz4QShBkEC+5w3f
         hOpDkHeIynke8mnG7Z1NnJXU2fC1A5ZHio1CnH4fR887v4rM26xdrha6gmofMI5Duh/N
         E/CAq+/NIBUNICffAMLYY+17nyxZaBuK31dz9PyF7xfHLF2nrXJ3U+ipmQZYS3/FQSFh
         HhDDtTrE02yaipqxGDhtYhVW8CEBlnX58VdF3oDqn6uaZEj/ruFLfnwN7FnCvdXbEBfN
         Tm6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776044328; x=1776649128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rHM3YXF7LUUih11DEyeSF4HP2j8S81Um3Rlg3lvVGk8=;
        b=gR2qG2WbBNdjLzg/n4UHLj/15jP52XgNR8zgtAq/eN3uDTqdd5t9Ws6rjjVr2m5Vcn
         6ZzFwWcrhZSIQMjjbgOB3LgaI/5Xeu8helIPfzYYyHB3n9wgo5nh14CqjnileRgW27il
         bXZz9rK9QpqgEMn/fAwgGSj14JUG/U5EnJyS2072EevaiWEVGfRg8qT0LlUJZGqRuKpX
         di1gjXBJ7fvEiOpkFth26SV79y4sCaUBSYztK1rU0iip26fwdjDndlBiTauMsKR6vmlu
         YMcvqT2DAjzgCFjOSmMzx7cd5Pzo1R0MrcTRBZd3apHy4qnZZ0ks5AbecbmeYIGGu9CW
         kKnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+VhK7KcGx7PYQnTbQocoE+GQpssBFWl3W8ODchAI5tqMleexVm6htYxkQsauiben2G+qYd+Z9TB/6SEwCkYN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtMd3AOe8aObFj9cLLsHMhqPC371b0Yr6I9/n29SPQFW9EkER8
	Bv/RZF/XdhfTaxJkV94tJfStYsJpQqGFzS6au27YJoQsiDvVnuuamK9Q5VNTVkS49PVls2qA0nr
	0N+XAEJDImPWTrego4MGCZf3SD7iEOaPJU+K6wwDh
X-Gm-Gg: AeBDieuOmKSJl++9CuFHC0bTP8AjJP5Qg/Eg4A67FKIMcrGprmXljwBlIiR8cnfvy9o
	6tqD+EuJW756e8CHpomVBexHmw2ARSH1+K69t7WxG0dlNAeW6GaGL90gMkWLHhu+mIGMNpjTQV2
	zXb3J82R8ptuzFKxEjU7/kwQ5cX1HA8hgK0z1ZDUYPQu82BtqXke3SPBitz2Kr20yWVeIbqM8r7
	CGmDBIhW25ZW52bNDrGvvxHaFL3al/NFnd+Thkh1X3J6fyeKa3ug3UL5FSXJbgjG1qDHjwQRJKf
	yjwzLz8=
X-Received: by 2002:a17:90a:289:b0:35e:58d3:3286 with SMTP id
 98e67ed59e1d1-35e58d3350cmr2477282a91.24.1776044328031; Sun, 12 Apr 2026
 18:38:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-fw-lsm-hook-v2-0-78504703df1f@nvidia.com>
 <20260409121230.GA720371@unreal> <2dd138a2ae87f90c55dbc3178d9c798294fd4450.camel@huaweicloud.com>
 <20260409124553.GB720371@unreal> <CAHC9VhT1X4HX4bGrK=mEzu=g=mZ-Wg-LDXVgZVe-e6oM+W9aHg@mail.gmail.com>
 <20260412090006.GA21470@unreal>
In-Reply-To: <20260412090006.GA21470@unreal>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 12 Apr 2026 21:38:35 -0400
X-Gm-Features: AQROBzAOzVjdc2Fm0JK51NQkLRAYu7tuztXcHDPMGgqzx6OZVzpwqD1l_OckOpE
Message-ID: <CAHC9VhRnYXjg+vE9a8PeykbXk91is12zYLaO7EFdfZPKMxDfPA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Firmware LSM hook
To: Leon Romanovsky <leon@kernel.org>
Cc: Roberto Sassu <roberto.sassu@huaweicloud.com>, KP Singh <kpsingh@kernel.org>, 
	Matt Bobrowski <mattbobrowski@google.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Saeed Mahameed <saeedm@nvidia.com>, Itay Avraham <itayavr@nvidia.com>, 
	Dave Jiang <dave.jiang@intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-rdma@vger.kernel.org, Chiara Meiohas <cmeiohas@nvidia.com>, 
	Maher Sanalla <msanalla@nvidia.com>, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 12, 2026 at 5:00=E2=80=AFAM Leon Romanovsky <leon@kernel.org> w=
rote:
> On Thu, Apr 09, 2026 at 05:04:24PM -0400, Paul Moore wrote:
> > On Thu, Apr 9, 2026 at 8:45=E2=80=AFAM Leon Romanovsky <leon@kernel.org=
> wrote:
> > > On Thu, Apr 09, 2026 at 02:27:43PM +0200, Roberto Sassu wrote:
> > > > On Thu, 2026-04-09 at 15:12 +0300, Leon Romanovsky wrote:
> > > > > On Tue, Mar 31, 2026 at 08:56:32AM +0300, Leon Romanovsky wrote:

...

> > > We implemented this approach in v1:
> > > https://patch.msgid.link/20260309-fw-lsm-hook-v1-0-4a6422e63725@nvidi=
a.com
> > > and were advised to pursue a different direction.
> >
> > I'm assuming you are referring to my comments? If so, that isn't exactl=
y what I said,
> > I mentioned at least one other option besides
> > going directly to BPF.  Ultimately, it is your choice to decide how
> > you want to proceed, but to claim I advised you to avoid a LSM based
> > solution isn't strictly correct.
>
> Yes, this matches how we understood your comments:
> https://lore.kernel.org/all/20260311081955.GS12611@unreal/
>
> In the end, the goal is to build something practical and avoid adding
> unnecessary complexity that brings no real benefit to users.
>
> > Regardless, looking at your v2 patchset, it looks like you've taken an
> > unusual approach of using some of the LSM mechanisms, e.g. LSM_HOOK(),
> > but not actually exposing a LSM hook with proper callbacks.
> > Unfortunately, that's not something we want to support.  If you want
> > to pursue an LSM based solution, complete with a security_XXX() hook,
> > use of LSM_HOOK() macros, etc. then that's fine, I'm happy to work
> > with you on that.
>
> The issue is that the sentence below was the reason we did not merge v1 w=
ith v2:
> https://github.com/LinuxSecurityModule/kernel/blob/main/README.md#new-lsm=
-hooks
> "pass through implementations, such as the BPF LSM, are not eligible for
> LSM hook reference implementations."

I can expand on that in a minute, but I'd like to return to your use
of the LSM_HOOK() macro and locating the hook within the BPF LSM as
that is the most concerning issue from my perspective.  One should
only use the LSM_HOOK() macro and locate code within bpf_lsm.c if that
code is part of the BPF LSM, utilizing an LSM hook.  Since this
patchset doesn't use an LSM hook or any part of the LSM framework, the
implementation choices seem odd and are not something we want to
support.  As mentioned in my prior reply, you could do something very
similar though the use of a normal BPF hook similar to what was done
with the update_socket_protocol() BPF hook.

There are multiple reasons why out-of-tree and pass through LSMs are
not considered eligible for reference implementations of LSM hooks.  I
think is most relevant to this patchset is that an out-of-tree hook
implementation doesn't necessarily require a stable interface, and
without a stable interface it is impossible to make a generic API at
the LSM framework layer.  As you mentioned previously, each vendor and
each firmware version brings the possibility of a new
format/interface, and while that may not be a problem for out-of-tree
code which is left to the user/admin to manage, it makes upstream
development difficult.  I did mention at least one approach that might
be a possibility to enable upstream, in-tree support of this, but you
seem to prefer a BPF approach that doesn't require a well defined
format.

> > However, if you've decided that your preferred
> > option is to create a BPF hook you should avoid using things like
> > LSM_HOOK() and locating your hook/code in bpf_lsm.c.
>
> We are not limited to LSM solution, the goal is to intercept commands
> which are submitted to the FW and "security" bucket sounded right to us.

Yes, it does sound "security relevant", but without a well defined
interface/format it is going to be difficult to write a generic LSM to
have any level of granularity beyond a basic "load firmware"
permission.

> > The good news is that there are plenty of other examples of BPF
> > plugable code that you could use as an example, one such thing is the
> > update_socket_protocol() BPF hook that was originally proposed as a
> > LSM hook, but moved to a dedicated BPF hook as we generally want to
> > avoid changing non-LSM kernel objects within the scope of the LSMs.
> > While your proposed case is slightly different, I think the basic idea
> > and mechanism should still be useful.
> >
> > https://lore.kernel.org/all/cover.1692147782.git.geliang.tang@suse.com
>
> Thanks

Good luck on whatever you choose, and while I'm guessing it is
unlikely, if you do decide to pursue a LSM based solution please let
us know and we can work with you to try and find ways to make it work.

--=20
paul-moore.com
