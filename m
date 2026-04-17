Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4E3BD646
	for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 19:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776453475; cv=none; b=iUs30yrPpxqfWuYlacRKnXUWglcGGPmLX9oNr9lEE06HxtEo0ESNFTMAmMbnfunXbKOViEzUhhTEBHltSAj2y3YeVXWrFhKbc6XRShtb7ThVhTqaySt/i18zAzOMcyHTYp+ACNpetUHuDjLUDrNUeRQyExRbW0iVJYGPeRSmfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776453475; c=relaxed/simple;
	bh=de+cgeiRloRqiMe4wUivFxwt1KqtqUuvg8OBq9NZKi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hda1dj4U7qi8+EwRSl+zFR1CRPTmh0pInNCc1SJ9dvvaTXaOvMwJz/Am3BDCF5qTsh3ByxTsoWiyEH/5ieZHFfh6wQ1p2RK82AGbxjxSKWeOK2P+jI1B6mPWmi3CRtVnwhE+qHZF4S3zVkG1DqsVFsOhBSA71eV6rUJrtet0SeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Sx8fcCLW; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Sx8fcCLW"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8a110e06b4cso11755426d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 17 Apr 2026 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776453471; x=1777058271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4EAYiUx134wz4kkjk1jnBH2zllAceLFfLUvioLTQuWg=;
        b=Sx8fcCLWseq3/lgxypDZO6saM5K9gzfIKNypH3NUSGbT5dqx7sAGtNZe4sRWAbtSKo
         kYlLDdv/LSV9Lz4MqvSZUrFT/0zy6GOc9/LN5By5UfPTbS/hQIZ5X9Hy/1Bu9tVkAh1S
         3mcpURKlwyMKqI2sF0iBTmG4qejHM4Wm525Mio/t0pj2Wgfd+SXl9IJQLHY3/hdZZhJP
         6B1OI7GtaiSQ+hWTESH7hcWeaHbPmNt5kp2p22y6VagKOfmpcI2BS+3CeRAPJ/kDnH/l
         PIFct8tdk/bNU9F5+Kzs/tDxkUIlecnXOJUDLpVGSW3EPUOrEFsDmEl0ZVdeGVWVGxYB
         ZAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776453471; x=1777058271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EAYiUx134wz4kkjk1jnBH2zllAceLFfLUvioLTQuWg=;
        b=bNddUUqux4Z8aMSOWpIEqkRXpHB8b8Ocjq/QhqU7+BQSrK2jpsuvaa/0WU4fMnVawu
         Cggm6sxRzPSiV6pKPe1IQy+0fFXL0KNItpz+tK8vwkffMHxDXaP3M3BBVDfS3EaRqOcB
         JzYCBnS69Jh26KyQjgqbQaI7chsIIz+A7pl+cB5t3UGkaaYp6jIkQfnorb30Wj/1VDkH
         0A8Wcq7JdqpY/RamQ/O72IXZRgSjMjHqx0qTpzJdz6AMMFf5LK1WOSKZgELqomLuu92r
         tbbmjSggqhWa2eFT3VBc9AYPw84o9p07zUc+ieAM4f0JFk5mw+XOR9VUZdM8B1t5jIYK
         nRJA==
X-Forwarded-Encrypted: i=1; AFNElJ+uCvwcpB8Xes9AR+p7yirV1Wc+hU1bfP3wUSFg7sUvw7itSCTtR13o82pvaOEHhu66o74KN8/VDJdAiecdPn4=@vger.kernel.org
X-Gm-Message-State: AOJu0YycH5ieMb7Fxk9RCV6fDMub6Vc2fwvkaV6bgd3C3+mVe3GtHqyS
	OzwEoyw9Htz3u0E1h67WY7mLF45OKeBFuTVBZieTgI+q8EePuB66jwmRsvZn3qqw9pc=
X-Gm-Gg: AeBDietBCehkcxzIUkzHjX+5XheaBbHWYZWq7/Z8xF0E8dBhOTFutCGdTnC81lsTLth
	Vu8b38iT6S7Gbp3GOX9Qi2ZftECOOFx553LRn4mJpZF0ocDtowjQ2vvBE0Bgc/eSbB811qN3RBA
	W9QpRzCLc6IX1/ZOSduiYrLSUrVgpruJR9vd+Dgoze9R8nsawn+NLzNhAM2bR/g46RwTIH4N0GV
	IH7566Xx8XeFIWCLPjmRQ6hl7H/sXjTxtypNoUMnFij2fkzhMF/TW34GMC/VnuqmUeTIjYB6+ju
	DELJwDQzoUHNDlfcJNAkix+pEpgA07ZG38u1swPNIOxOntm05vglX8ks9vbyUPlqlP6nJCFhVk4
	0U82XB/WwkNc7jeGMtFpiAfSv8cMECsxxpzWqcIAQgX+m/aiJsa84SpyQa8569PF/8AiWAxkAyI
	9+X9wkJSBxB3lqVuY5QjGg/NLExC5Jgo74v4AOhUQQ3OxQ72pU1BQHjGFaH/CMmTNkivXdP054o
	a4BxXFDPkyLOP4h
X-Received: by 2002:a05:6214:2a46:b0:8b0:2d20:ff79 with SMTP id 6a1803df08f44-8b02d2100femr46126906d6.27.1776453470830;
        Fri, 17 Apr 2026 12:17:50 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ae86947sm26222946d6.37.2026.04.17.12.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:17:50 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wDohJ-0000000DV61-2ye0;
	Fri, 17 Apr 2026 16:17:49 -0300
Date: Fri, 17 Apr 2026 16:17:49 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Paul Moore <paul@paul-moore.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Roberto Sassu <roberto.sassu@huaweicloud.com>,
	KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Itay Avraham <itayavr@nvidia.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Chiara Meiohas <cmeiohas@nvidia.com>,
	Maher Sanalla <msanalla@nvidia.com>,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Firmware LSM hook
Message-ID: <20260417191749.GK2577880@ziepe.ca>
References: <20260409124553.GB720371@unreal>
 <CAHC9VhT1X4HX4bGrK=mEzu=g=mZ-Wg-LDXVgZVe-e6oM+W9aHg@mail.gmail.com>
 <20260412090006.GA21470@unreal>
 <CAHC9VhRnYXjg+vE9a8PeykbXk91is12zYLaO7EFdfZPKMxDfPA@mail.gmail.com>
 <20260413164220.GP3694781@ziepe.ca>
 <CAHC9VhR1Uke9P==CELKavBcogHoNCtMZFfNWUbgm5HYUfomhtw@mail.gmail.com>
 <20260413231920.GS3694781@ziepe.ca>
 <CAHC9VhTLamfe4C81ZNRVT=H32x+KLxSqH3o0eBfrHsWAgAqxCA@mail.gmail.com>
 <20260415134705.GG2577880@ziepe.ca>
 <CAHC9VhSECYihup=tURo_Qk__xUdYYPkHgnz5CWA0BrRAkvwbog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHC9VhSECYihup=tURo_Qk__xUdYYPkHgnz5CWA0BrRAkvwbog@mail.gmail.com>

On Wed, Apr 15, 2026 at 05:40:04PM -0400, Paul Moore wrote:
> > The NIC doesn't know anything more than the kernel to call the LSM
> > hook. It can't magically generate the label the admin wants to use any
> > better than the kernel can.
> 
> The NIC presumably knows how to parse the firmware request and extract
> whatever security relevant info is needed to pass to the kernel so the
> driver can make an access control request.

Not in practice, we'd have to agree on how to describe the "security relevant
info" and that won't happen..

> Leon mentioned that different firmware revisions would have different
> parameters for a given opcode, and that one would need to inspect
> those parameters to properly filter the command.  Is that not true, or
> am I misreading or misunderstanding Leon's comments?

They are ABI stable, so there will be rules about future changes that
old software can follow to ignore or reject future things it doesn't
understand.

> > > The access control point itself represents the requested
> > > operation.  This is possible because the number of networking
> > > operations on a given packet is well defined and fairly limited; at a
> > > high level the packet is either being sent from the node, received by
> > > the node, or is passing through the node.
> >
> > I think we have the same split, fwctl send/recive analog is also very
> > limited.
> 
> Sure, but I thought the goal was to enforce access controls on the
> firmware requests based on the opcodes/parameters contained within the
> firmware request blob/mailbox?  

Yes, that's the goal. It is the same as iptables being able to
identify that a send system call has a packet that is http or dns. I'd
like to have a fwctl RPC ioctl system call identify if the RPC packet
is A or B.

> > Deep inspection on the packet blob determines the secmark.
> 
> ... and this would be done by your BPF classifier, yes?

BPF would be one option. We could probably also meaningfully do a
fixed set of matching functions (ie pkt_data[X] == A then MATCH) more
like iptables does if that is somehow relevant to LSM.
 
> > LSM takes the secmark and determines if the access control point
> > accept/rejects.
> 
> At this point I think it would be helpful to write out the
> subject-access-object triple for an example operation and explain how
> an LSM could obtain each component of the access request.

I think I am talking about this:

app_1 FWCTL_RPC op_unpriv_t
app_2 FWCTL_RPC op_priv_t

- app_x broadly comes from the process executing the ioctl

- FWCTL_RPC identifies the IOCTL userspace called to send the RPC
  packet

- op_X_t is the result of the classifier inspecting the RPC
  packet. Admin tells the classifier to return op_X_t similar to
  how --selctx does for iptables.

For sketch purposes I've used the words priv/unpriv as something an
admin might want to setup. As I said above the actual buckets and
mapping would have to decided by the local admin.

> > Same as for networking. Admin understands, admin defines, kernel is
> > just a programmable classifier.
> 
> Are you able to define all of the firmware request operations at this
> point in time?  That is my largest concern at this point, and perhaps
> the answer is a simple "yes", but I haven't seen it yet.

We can identify all the IOCTL points where the RPC packet will be
delivered to the kernel (send/recv/etc)

We cannot pre-identify all the mlx_XXX_op_t's an admin might want to
use.

The same way secmark cannot pre-identify all the XXX_packet_t's.

Jason
