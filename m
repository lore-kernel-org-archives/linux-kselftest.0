Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7C637AA8C
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 20:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777064385; cv=pass; b=hLZP3eyItaDp8G1xbjeC5/g1tAX8aOX3ydVG//NQ57GVVSV/g6WMksnyjpb3M+FHZzOJ8dRQfe11hJfq+Q7paAlUalptBKexHtHrXzH6KnmJKgQagHS+jeeZkOTpzphzq3GQc6jbR7Awd9aurFpMtgrLmrqheeBO0AvMqpNwLlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777064385; c=relaxed/simple;
	bh=UeH21MWoLZK9qwhPVVQmSENxjvt2h6USDonb8uOfEZ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hIzhTcJ5kYkEr7lm4Ckvjly2iPcMedjbk3P4ycCsJUBhg3gTBb3rVYFULp1fefOkkS6+p2NjXzNJ/xDMS8BbbwO4mFAEKBNDW4+Y2PY/zRdwTJnivDfgVdETy/0HTpOZ9IOKrKEvoGx1oEJw++aPnLlxs0iU7WbIXnraxWFTdbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=AFYxgzKY; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="AFYxgzKY"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a8fba3f769so37780385ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 13:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777064384; cv=none;
        d=google.com; s=arc-20240605;
        b=LrsQsaHQIMaqCeGJ5Bl1aNC7Xn1kez4D0+RhLUidLk0EAz86m2w2cV7xheWFPyPZ0q
         uUen9lD2cHrLdJ7grToyCBZY/HnG9tGIw9oTlVOe4EYkEgrMqVSZuCqUIJqo0JwrvcX4
         Ar+4aXDMV+b0VAsKB3HR2cxCKZ2L5qVrBuiWColOwopWaR3Q4JeW2lk9xXfyOBqI8ja0
         WQEebAfO1gt1aQ8I8t+tJbn9mfjbYbxliwYl8zrAIhh+i8TL8Pp2nGKYmZXXThP2/Prt
         0UqOtqodIrFKyIAFOiNsbA8pNyGWqh+vZObJe49K2H+ix59riUJFenFJcRyKwIBOG0jk
         o74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cx20PlWvPq7t/jSP14LCSKX3HGCyhuna9yTPTpknTk0=;
        fh=3pnyGMtLRqhgeRGtPNcqY8lkHif73Z/4M6Bf4Iq5mfQ=;
        b=T5iTTvUiGcX4sV0qkzGn/A8sz3hWU3lIbl746qzZoR7q7GL5rSS6ld2FOYGAMKZZ/M
         owbKJb0Ms2WMC4NQSS9ED0s3d5tAOYWfEhiEMrcwicRsey76BTreL+IKhuv3O5KqsS05
         pai4cfUDNub8cmQs5H7QxdmpBI0aMpkarHz5LHHY+4f2MoHJifgECUzv+BYrWZLjh9I4
         mREs+RzztMmWkvhqgrLV7EgBcD7RkTp2J873ZW4pqHrL+NwN0AwLMbsfR5Wcc4PwP3lL
         d2IVuebdO6WgK7kwUNs+j4oyVEagvrT1qT9yeFcaPUNAVHKirK3nTF/6Y6T3w9eCVPEP
         rz6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777064384; x=1777669184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx20PlWvPq7t/jSP14LCSKX3HGCyhuna9yTPTpknTk0=;
        b=AFYxgzKYRbUDqVkO6uhmxHDIhrpxxUfLe9M8Nc9HTLwwXEU8iJLJ47I10OAByCP2pp
         uUMkGmNNpDr6FjxxFMIRfQrLgrK12q1r7gw1bPCg3dM0BgDPbm+Ct3B+ifv1CSd5fcgz
         vXaE6nCxV81WZ0UE/05xEUWmEcatmb+MA0xfj1kIUNNalWC45UW3Oy6bmqpQa7A8C2GH
         EJx2Rxtc86GS5d2V5u1aL8f6S2lQIe5dNBg33IWreA02sX7/2dqZFzKf/YekFFhEDvBs
         iTyoEj+N2pHryD/mVdnL+d8xAbs+ACpsZohmWh6glBzJ40vxQAeD9huI84+0xkQxnIT0
         I1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064384; x=1777669184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cx20PlWvPq7t/jSP14LCSKX3HGCyhuna9yTPTpknTk0=;
        b=TpuwoQQi+3NCvXD/RpXgsco6s05e0kqrCPnhElpJUnfmdInfIl8nQSbNRrAOE+dlE4
         q715f71Az2Ha5sYhhoBkCAlUYHWJyVRaFiLsBtHzy270hwbtVO8+KWUEnZtsxxe2InGM
         KV00boy/plKHHcA2R9O93f0JsmxyUQwM5rMNluSq7aDjwFPESNE75iJa/Zkjx3xKSyA0
         Ly+Z3c/OFmhQdswAgADSpnERwhaUsTPp91osCcoVWXuLqQ4R67O1AainTohx5UYNUgCM
         kvF+HCAsmqaex8o1Eif5oFkHCJl57tfJfqRBj3TInnx8tMt+nFqn8Dk6+AIcErH5GKUY
         PY5g==
X-Forwarded-Encrypted: i=1; AFNElJ87CXfDrxx3QRRI/Fz/qClE0LmW34Y2tHFeH5+ptXKNP1Vg/FS+ZRbzDgxlEnWLN8AmRSsEWKEHmGo4xzby+Go=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1kTKXdTlNfcw+hcCnWOwGtQMdshRtq+0f1WEsGlbUXiVUa5hu
	H2/w7Rqzp/48sgDGFFjeL4IbOpSM+05pr8BrQvE/TxB/x4Nb6P1+bQrzVthXWxNz3+X7RUcvLzp
	TglxR9tKYWpp6pXkPeUdnOTxYapXX6Ed6hrbqcyGV
X-Gm-Gg: AeBDieu4Srqe7thT6AFXhtj1WH9iaAtrfDXxARitpWBAiPVRrRmbVyaS7HmcBlv1JMp
	vOCFDox5PxYMCtOPeDF0PAgzSEPKDPObL6TLxhJNkcuJ8mCXNCc+WXjMijOF4hA3bc7rgfkK7Bi
	ElAgdycYCsaPBqfCRZwqC5eXhOcpL8ziUZpEplCws6k8ZdrqKRoiZJNlczUuEWvdJdJjNH8dIed
	fyP3wDJX29w8YlWy0TG55KGXzGvhySc1F0rx9ICN/oTUIT0ZwGcCrwBiMfnKB7Rh55kA/XL88u4
	xtpjmKsCa7/1Qzs6Eg==
X-Received: by 2002:a17:903:3d43:b0:2b0:5d60:7f3f with SMTP id
 d9443c01a7336-2b5f9ee90bdmr253173065ad.16.1777064383845; Fri, 24 Apr 2026
 13:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260412090006.GA21470@unreal> <CAHC9VhRnYXjg+vE9a8PeykbXk91is12zYLaO7EFdfZPKMxDfPA@mail.gmail.com>
 <20260413164220.GP3694781@ziepe.ca> <CAHC9VhR1Uke9P==CELKavBcogHoNCtMZFfNWUbgm5HYUfomhtw@mail.gmail.com>
 <20260413231920.GS3694781@ziepe.ca> <CAHC9VhTLamfe4C81ZNRVT=H32x+KLxSqH3o0eBfrHsWAgAqxCA@mail.gmail.com>
 <20260415134705.GG2577880@ziepe.ca> <CAHC9VhSECYihup=tURo_Qk__xUdYYPkHgnz5CWA0BrRAkvwbog@mail.gmail.com>
 <20260417191749.GK2577880@ziepe.ca> <CAHC9VhQbpS9XpO6dWu7gOiX=ppjtAxnNBOFe6s5wjEZNpMRjgw@mail.gmail.com>
 <20260424143603.GB3611611@ziepe.ca>
In-Reply-To: <20260424143603.GB3611611@ziepe.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 24 Apr 2026 16:59:30 -0400
X-Gm-Features: AQROBzBvtUdT2Z9qKk4YO4TpY44cZkRRfodVGSuPlBOevRtYkwWicMOMpHeLYC0
Message-ID: <CAHC9VhR++21SD+v4Bb16SQmYHgJYZ0ytQ+BecGPNK+fEOe4G7g@mail.gmail.com>
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

On Fri, Apr 24, 2026 at 10:36=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
> On Mon, Apr 20, 2026 at 08:58:09PM -0400, Paul Moore wrote:
> > > > > > The access control point itself represents the requested
> > > > > > operation.  This is possible because the number of networking
> > > > > > operations on a given packet is well defined and fairly limited=
; at a
> > > > > > high level the packet is either being sent from the node, recei=
ved by
> > > > > > the node, or is passing through the node.
> > > > >
> > > > > I think we have the same split, fwctl send/recive analog is also =
very
> > > > > limited.
> > > >
> > > > Sure, but I thought the goal was to enforce access controls on the
> > > > firmware requests based on the opcodes/parameters contained within =
the
> > > > firmware request blob/mailbox?
> > >
> > > Yes, that's the goal. It is the same as iptables being able to
> > > identify that a send system call has a packet that is http or dns.
> >
> > I think we still have a disconnect here.  A packet being a DNS or HTTP
> > packet is different from an opcode.  The opcode in the iptables isn't
> > "DNS" or "HTTP" it is "INPUT", "OUTPUT", or "FORWARD".
>
> I understand that
>
> > Most LSMs will want to know who is initiating the firmware request
> > (the subject), the requested operation/opcode (the action/verb), and
> > the target of the request (the object, which in this case is likely
> > the kernel or the device).
>
> How is
>   system_u:object_r:httpd_packet_t:s0
>
> A kernel or device?

It's not.  It's one of two labels on a packet.  I've cautioned you
about leaning too heavily on the secmark comparison as it falls apart
in a number of places, this is one of those places.

> It is a label for packet contents. I also want a label for packet content=
s.

According to your explanations, my understanding is that you want a
fwctl RPC operation.  That is not the same as the secmark label
assigned by an iptables/nftables rule.

> > As I understand things, the action/verb is going to be the opcode
> > within the firmware request.  If you believe I'm wrong about this
> > please help me understand why.
>
> You could make that choice, I'm arguing we should not, and it should
> be in the object side.

Okay, you believe I'm wrong, that's fine, but you need to provide a
(better) explanation for why I'm wrong and your approach is The Right
Way.  Present your case, but please do it without referencing secmark
as that comparison is horribly broken at this point in the discussion.

> > > - op_X_t is the result of the classifier inspecting the RPC
> > >   packet. Admin tells the classifier to return op_X_t similar to
> > >   how --selctx does for iptables.
> >
> > I've tried to explain how this doesn't match with secmark, but I'm
> > evidently doing a poor job.
>
> Yeah, I don't get it at all, sorry. I fell you are making some very
> nuanced distinction with HTTP being an object but the HTTP-equivilant
> in fwctl is not an object, I can't follow it at all.
>
> By that logic:
>
>    iptables -p 80 --string "GET"
>
> Is an action, and it should get a unique action in the tuple.

Let's both do ourselves a favor and drop the secmark comparisons; I
think it is only hurting things at this point.  If we stick with the
secmark analogy I worry we are going to keep repeating the same things
to each other without making any forward progress.

> > If you want to continue with the secmark comparisons it might be
> > helpful to spend some time configuring secmark on a SELinux system,
> > and writing policy for it, to see how it works.
>
> I think I have a pretty good idea, you haven't said anything that
> contradicts what I expect..

Frankly, several comments, including in your last reply, indicate you
don't really grasp secmark, subject/verb/object, SELinux, or some
combination thereof ... and that's okay, you don't really need to
understand those details.  Let's move past the failed secmark analogy
and return to the fwctl hooks, that's the ultimate goal.

> > certain action on an object.  My concern with your example is that the
> > object isn't what is actually being acted upon, it's the requested
> > action.
>
> Object is a label for the packet contents.
>
> > The fwctl ioctl/API allows a user to act on a device, with the
> > actual action being specified by the fwctl payload.  From what I can
> > see, the classifier's output is the action, not the object.
>
> You can take that view, it is certainly one valid way to look at it.
>
> But it is completely impractical.

Elaborate on that, because from what I can tell that is the valid way
to look at it from a subject/verb/object perspective.

> > > The same way secmark cannot pre-identify all the XXX_packet_t's.
> >
> > Once again, I think there is a disconnect or misunderstanding, on a
> > SELinux system using secmark all of the packet types, e.g.
> > "XXX_packet_t's", *are* pre-defined in the SELinux policy.
>
> "Pre-defined" in a text files in user space controlled by the admin.

That's not correct.  It's kinda like saying the NIC driver sources are
simply "text files in user space controlled by the admin".  The
SELinux secmark labels are defined in the SELinux policy sources which
must be compiled and loaded into the kernel before they are valid on a
running system.  Policy must be written not only to define the secmark
labels, but also to define the access control rules which govern how
those packets are handled by the system.  The iptables/nftables
command lines simply assign a secmark label to a packet; that's
important, but only a small part of the total equation.

--=20
paul-moore.com
