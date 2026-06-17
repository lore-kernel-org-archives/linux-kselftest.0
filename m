Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2842F99B8
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 04:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781670583; cv=pass; b=vAX1dsq3Yd/VaJqQcW8vHC8Kf40gjead90d9RsAW5OP0wlMIzReY6nsS88Aa2NlT9sYZ/Oxn38lCuuIJH4ZpJAykGDKh7OhWPHH2XxJ71UtyFGtKh4IF34+1h7cpF4fM7LgarDvZ6cV+5JFTup32zqwTT5P2pjjUQF639GSTEcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781670583; c=relaxed/simple;
	bh=47Xs0q0zKFuLpxzFZlmUfWNeYrh90WLJCmlkXjPRSRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceQ7uEOnJ+k2B7kpiwIoi3+tXa7pDV8vWlfJ0kfd+xkdQXc2cfmOhw8B+gk5YOTSdPXcA7XCydkU8XIzq0wiz0aJQM8RPiIq28dEHZGlbdsMO/jykf6jFv9fczi5eS8YmBeLtHw5erh5/9n6yoaXrcrkzgfCeNnC0I647a8gYnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l7HvvQGM; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l7HvvQGM"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51778077b28so58631151cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 21:29:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781670581; cv=none;
        d=google.com; s=arc-20240605;
        b=Xam1S/gT8NTZQD8y19nC2mKUJxz9hYhGpA143DEH8ULDU8gPHzhoCIBnkVUGjJMlEY
         7FpuGdw3u9kMlLXPgnpSqSa5grCBktwFnzY5AIYG+dAhcr4VGLl+j1ugiyEN96+SJeS3
         tPqkBv9vJEe77wDrK/JVfu7CiWkEKcr40YjCqAI53iezkQXDiR1qVBk5DIv9UwrjZmVW
         Ym7ostE2kEc1PJOdnMqDbAhHlFuIuOkvuPPuxDCuUEgMzGqTFqfTX6xRFRmb/R+HltIN
         u3S4mH3GGfEbsC95inS0gfXNnqeauOrJOeqrziTYZiq4UU/wv3d7wQ4JkSUYtl/1AcnL
         nhVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=47Xs0q0zKFuLpxzFZlmUfWNeYrh90WLJCmlkXjPRSRk=;
        fh=M5SkFL88URF9Ik64J1e7ZVHYHdnLMy414Ya3kgSiDvc=;
        b=gavhFlduZ/Rszu0cT6l+s0iGHbVtxPFbxaZenNMnykJyXlyMvOuvvVJ6enJBEKn+Ts
         bZMwlKBCsZmq9W6GrhGRI/BYLUxIlHmB8Etc76hoGpi26xOTHRZ9lyyOCiGpcZA8Y6Yn
         VPEapXjQRFP+2cdHgpqPedA5r1ct88CyNy+cZ0j7GYrciVBSnG1yty3vzce0VcsEn7zp
         9kmi4LkTP/H6KvcsItkFMY0pGZjocIkqcAldiK83S4dGR/cjHHlhecdrlmTi9+oVCbo0
         yF7F2eyNEG+lrjBfz+RRgBiO2ZqoDl140tHr0xAvzgYr8yFgF7NVxTAbckp2rUCn8Eh7
         MSug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781670581; x=1782275381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47Xs0q0zKFuLpxzFZlmUfWNeYrh90WLJCmlkXjPRSRk=;
        b=l7HvvQGMWHbNOvr+/pv/qbWlX+0YsPf/qxb9EJmkeXmuf/+i8kGs8sgeooaMTxBs23
         rKka2NLbcZe2ZMwN2ruDLC1uWEk2fsQgDqbOAGsOqmb/07vAj2swdC7MlCVnrOoKnMFg
         6LRPWPU/OqOdYkUgfBbEMRLrbnrNYsXwhzgAkbxO9EmuUtzjYzOd/eh2xpsWKphzkJTC
         zPg7AafOLwXX1sNXKXQ6Nw2NLy53WtDE/M8V+O6I0SlWMdOGa+b+8pi2G4BNTNv0Y4RT
         /MQuhAS9vfoBperVt9o1+xgKGtF3lipiorIojuge+neSGEAbkUGvX97QQnuznqLw3iX+
         6HZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781670581; x=1782275381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=47Xs0q0zKFuLpxzFZlmUfWNeYrh90WLJCmlkXjPRSRk=;
        b=pnXHJw7FxqVwcWv+y4aPO5TTw8mHLXSvc00wcT7YodUDxBy5JI5mm2+0wJ53mR4wOd
         d6SuHfhmz/9wGFP/xSYUA8YTjYLPwcEH2TCQERQMYHN0V8PJvm8GjZBjKhoNyXDafBMQ
         L0p30KkABAQPYJuy0qdOZ73bV8iPgjcf3SRvhFsW1G1RItBAofofNHGY4JP42gRGWeMy
         t7kfXsPPi7VVf27XB5q4PKD6Y/NRUKj2nDgqMMTqvT+bxvTUAf/LsABsgbUB4YbBTBC9
         TqFuyhEnkNEIUa3MnTJv3/LuXzUM75KTUt7ntn/fj5U35YX/dAr9uXovivzmYbPpc8O8
         I5GQ==
X-Forwarded-Encrypted: i=1; AFNElJ89KT+FKWHAIDp7lKGyWSlIesHhtF1LJGE+16165uh6W2r7NgiskqVbdNWmiNpPbV4+IQlcnnR0ou6U2z/1e+k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxw8afDMBSq8OLXL7hj1t/XUP8k9CTIRA2euc1dEd9mHLuJBNx8
	T1yoD11o+wa7DuV8GkTRtkTqTu5+zCWifOZ1xsiDZY/N3RN/FK6jBpAncLFLZvC8mqQyi/ts+bD
	WZ8u6qPR2uN+TJSp4CyBO8u4grheo/j9dKnIbYs1/
X-Gm-Gg: Acq92OEd/lfKif4c9t5dyKetKw4GtCBLqZEa4fXEd3jsQ/sV64ngi2TeFLd7jnWBB+K
	FMlbR3D6mhZWQjY76l+rzFxYKN0A4axx4g24J58pG/KJvtysDmL7kXR4TuWO2Fl+sQ6EhkNhoIi
	fZbI5IQFtVDKhsWGElQ11hfwCFKJ9bIni1LPQ4fFsa7DKbANUbJhiPnLA97SFpa5WjPp0+2z2xH
	jxqA74jioSeSoczz3G/MIrMomklBXAhdlYN06jrMxbBwpsKPLuJEmWTNoAX304xCLHR1UdaV/DZ
	lwIgRWNYIWsNeE11Ipy6SN/cTNwCKuiGJkhupqzF9SRkd7K23sc3PR6AQoW6yJ67MxfAdLaQ5vb
	qYyNVNMRR
X-Received: by 2002:ac8:5ac9:0:b0:516:d4b1:48cd with SMTP id
 d75a77b69052e-519a8c6ad22mr37477331cf.2.1781670580489; Tue, 16 Jun 2026
 21:29:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614071756.239686-1-chia-yu.chang@nokia-bell-labs.com>
 <20260615185102.5e8de52d@kernel.org> <20260615191704.31be22da@kernel.org>
 <PAXPR07MB7984585F9348BB3F000EB330A3E52@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <20260616082302.3618bd90@kernel.org>
In-Reply-To: <20260616082302.3618bd90@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 16 Jun 2026 21:29:29 -0700
X-Gm-Features: AVVi8CcPpCqwMc0RCNrYPHiIGgcG9rWXHumUyWiuW_YFsydzCpRf7A9XWj4rIrU
Message-ID: <CANn89i+Qw8JecdpbEf0tC6RgvEi2aMxA=680xY2XZt-TXXvJrw@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 1/1] tcp: Replace min_tso_segs() with
 tso_segs() CC callback for TCP Prague
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>, 
	"ncardwell@google.com" <ncardwell@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, 
	"yonghong.song@linux.dev" <yonghong.song@linux.dev>, "song@kernel.org" <song@kernel.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "memxor@gmail.com" <memxor@gmail.com>, 
	"shuah@kernel.org" <shuah@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, 
	"ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, 
	"andrii@kernel.org" <andrii@kernel.org>, "eddyz87@gmail.com" <eddyz87@gmail.com>, 
	"horms@kernel.org" <horms@kernel.org>, "dsahern@kernel.org" <dsahern@kernel.org>, 
	"bpf@vger.kernel.org" <bpf@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "jhs@mojatatu.com" <jhs@mojatatu.com>, 
	"stephen@networkplumber.org" <stephen@networkplumber.org>, "davem@davemloft.net" <davem@davemloft.net>, 
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "donald.hunter@gmail.com" <donald.hunter@gmail.com>, 
	"kuniyu@google.com" <kuniyu@google.com>, "ij@kernel.org" <ij@kernel.org>, 
	"Koen De Schepper (Nokia)" <koen.de_schepper@nokia-bell-labs.com>, 
	"g.white@cablelabs.com" <g.white@cablelabs.com>, 
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>, 
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>, "cheshire@apple.com" <cheshire@apple.com>, 
	"rs.ietf@gmx.at" <rs.ietf@gmx.at>, 
	"Jason_Livingood@comcast.com" <Jason_Livingood@comcast.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 8:23=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Tue, 16 Jun 2026 12:23:11 +0000 Chia-Yu Chang (Nokia) wrote:
> > > On Mon, 15 Jun 2026 18:51:02 -0700 Jakub Kicinski wrote:
> > > > On Sun, 14 Jun 2026 09:17:56 +0200 chia-yu.chang@nokia-bell-labs.co=
m
> > > > Eric, Neal, looks good?
> > > >
> > > > The min rtt thing in tcp_tso_autosize() helps a bit but if the send=
er
> > > > gets congested for a longer stretch min_rtts on new connections are
> > > > high and we're back to sending small TSO, keeping the sender overlo=
aded.
> > > > Which is to say - I _hope_ this also solves some of Meta's problems=
 :)
> > >
> > > Ugh, I didn't see the Sashiko report, it's only CCed to the author an=
d bpf@, not to netdev :/
> > >
> > > The zero-check sounds legit. Let's revisit this after the merge windo=
w.
> >
> > Thanks for the comment, I will take action after the merge window.
> >
> > And, please correct me if I am wrong, the next eligible submission is e=
xpected from 30-June, right?
>
> It usually opens Monday morning (PST) so Jun 29th

I missed this thread, I can not keep up with emails sent during
weekends in May/June/July

Please Chia-Yu, consider sending patches during weekdays; I would have
a better chance to look at them.
