Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BF347D92C
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 19:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768937746; cv=pass; b=SnJCX7xRvQnnUoWrTWaTXmvBr+Qrhy4syJbgv/ozJyq1WTJQvP8cCIrbF6WoIEuezDIjvj25wE8LEaYxsa63/emCPwEhr5qePkRI/ozydN4DjkqcxX3UcsHcAibeVuNWHGnSOzRmhh6cKP4kWQeE5fx7JGnvXfUBxZdcU49CqQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768937746; c=relaxed/simple;
	bh=WF1YekMK7Vrv0H+TF4xGFci8W9+NmGzjNHWUBOBXXGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKBUiE+WjIg3MvCPqRGfUvxjiFt6+ipcsX9zjN5jXLy28KxIHy2NfJ//RHL7MfC7n164Z6qWkVFp9RJR2UsOM0YrJHVS/N4AdrWWDME8P8CYRqlWPLIhLm1io8DlGSfN7LR1uEHz4VNyjPAq2A+nbNbljJ4RaZ3tfA+yRIwjK3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ERoCygH3; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ERoCygH3"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5014acad6f2so73431cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 11:35:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768937742; cv=none;
        d=google.com; s=arc-20240605;
        b=RL4wI7+kgRfw0+FTPwQf21CKHYsCEmvBYTgAxamlSoH8z08Foa/hAz3wsbT0CBgWQt
         s2kEjje07hEFHyBp4gKFMTIjcuRbgVwG9DP/W108/uiZ7iAV36mHBmzs0iKlenR9/CYO
         A9tjOzs6tcZYt9+WiUSHYO/ngDPE3cRZon8H0s4A9dHwWLBcRMedkuDG2XDMM+xwzAEG
         EanTXwKyNRPknj/7hj9gMYSlPU7St3/CIcpb8l5Z2lFLYIKVAZYVAjrQnh/7xy6dyfZM
         uKiAshGckdDBoUVshCretaGbYv2UGDZcSUpf0wt5TkTdiUMCJTBlBQWOvonv9ViVg9Dd
         6n5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e/JLh5ORNBH9Tuc6LhtRVdmaDdTnbVj6AxCAFCa2LO8=;
        fh=WTw6yVSFC9aprq0RoStwQrf9amd+nk3cZxrhmD1bgF4=;
        b=KR/WJAuIFn6rBHD2b0xtZCgd+wzubc6xZwcWZc2WOZhJiRyBKs8TQVEDeXvkzXTLXm
         QLyCyIpIw3U6UwKdFyo3XmnfuAJHnSwWnXn6zu0dq7X9qDchZ6nD5cLjDIgT5QsnKNTO
         ejEW7HjJ+wK6xmIg7ClbkR7fkv3PzHyBolbMV69g1LpERxA+kd0ei95RMHbphwcQLPyG
         5pNZuSz2sC6K+Xn/DaCjjIsdBEkmrF6kvMJ57R3RN+k4YSsu6M0D48+Djzqx8SpG0D4Q
         3UIvHoQ1qQEuh0JxZLi55QJmcNtaZKZXPDSPgUzhFMQ3cllXyTkJDAFPo8UtXAjhZT4p
         O+Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768937742; x=1769542542; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/JLh5ORNBH9Tuc6LhtRVdmaDdTnbVj6AxCAFCa2LO8=;
        b=ERoCygH3AcFxMxPwYGTkGZTbXZDhlgxcMEbmwm4PJpAJzPZ2jOhEMIfvhAoifDxQKJ
         JnQ852p7Byo1BQvVA/vhZgpKJaTmogDGXL+apt357qHp5BQ78ffFdxn6ZcvGdpfPNxeM
         fa4/56gIhjfaJmYJGGmUmMqIZxpV3vaXgv239ZfseDJfbx7TLXvFG7JuMw4QJK1ooyfF
         PORPIbcTiP763DY5PsqoBNmll2/YBizkCEh1HLiNNYe+WX15TB87NdRq/F0wWTDWCX17
         aB7Zagw9HuV2iUGBnTAPh5N+L+5gzJE0ao/csczIiPQcz/+qINWAC5iZg8Ec62KcO224
         +F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768937742; x=1769542542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e/JLh5ORNBH9Tuc6LhtRVdmaDdTnbVj6AxCAFCa2LO8=;
        b=mlRjf2cSDMozlts1fByZgcvsXt+nJD31bG50NvGpzBdRtgBlyCEwfkbcV3jBr10uux
         JlH4uk04xgP5u1SfWVQlAzeB2j6w2ZspwX7wqPs9ME6Hl3fnLdHlOz3hCsQNXzk8QCc2
         Q1uAwcfpMP9TkSOICAzEQZqRAMIzDihWLOtkbx7nUqojDavVZxiQZDGzwvTw0yjQhmUM
         leyj3zZ7Q+ZJhSzVrfZjDxnjNE5xeQujEf0LbV6GpkeUfkk5jIdLFkqHAlA/X4YM2AaC
         VGqq7Pw6jaQ4Qfq/u3bfNR3eLAfUUCVizuMDAmeda94EfEE3bn2w/Y0xz4wCITa7uPtD
         RIHg==
X-Forwarded-Encrypted: i=1; AJvYcCWJl08+/hv8XwdTlGWNkcq64b01E4zigbge5wW6TdJKkm20J3bp8YLzj2jSdNj+1BtVYieBZPmOw6xRVFg3wvc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgqhy4ZlXKmsrcopXzvhe/O2x2DwYT0WqQCwElEN2uQ+cLWcJx
	3PnSJEcHUyoJg7VUMONl7Rbhy3H9Ro564xi/En8tp4KzoRkBmVSmpOXcEOTVgbd3DjLsZzvj3KX
	OYkgNu6p24QlnMGKzzm0D9jeRBhTyQUoNiW8rRSlf
X-Gm-Gg: AY/fxX7yuEG1QyNaq6EKt5A0rLjTLyE9D1xUfkmvIg8ExEJ6BHIy3T50lJ7RozgFuCt
	tej2MZDpCw4ozeEYAFssglKD8P2jixT4zggqYN9xtONtLLS1JcZM+bueU4HuF0Qtnng/UyV7YV8
	tRilQkHbROEnOYMWdrKOZPxnBgdiGRqywBD9M0JSPQpxL/TahhQW6/CO+BTczHz30ryVZHz+CjB
	7ZPtuvYA7dulefLgpYATaYaoxguJbT4KKIUU7oK0qPbThzQ86SnTV7Gd/xsNNBeRc/c1/SQaeyB
	SLsoCDtGFcH9JQQvJXbaxi8Ou4ayB5N18SMRq0lX6WVu8ZBCa1Op1ZmgFt4=
X-Received: by 2002:ac8:5d0f:0:b0:4ed:ff79:e679 with SMTP id
 d75a77b69052e-502e0cee0e6mr1190331cf.19.1768937741836; Tue, 20 Jan 2026
 11:35:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com>
 <20260119185852.11168-16-chia-yu.chang@nokia-bell-labs.com> <20260120105352.423ea3cd@kernel.org>
In-Reply-To: <20260120105352.423ea3cd@kernel.org>
From: Neal Cardwell <ncardwell@google.com>
Date: Tue, 20 Jan 2026 14:35:24 -0500
X-Gm-Features: AZwV_QhVrFxVPZIRT7nXwat9WAQ6ye9fzegNqePUSTW1gnZC3HPe2JXn7dKWhYk
Message-ID: <CADVnQykJZhYQZMtqg+Cm4BnuVeaBjPi+VWseNK+K7Y4eZRq_-w@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 15/15] selftests/net: packetdrill: add TCP
 Accurate ECN cases
To: Jakub Kicinski <kuba@kernel.org>
Cc: chia-yu.chang@nokia-bell-labs.com, pabeni@redhat.com, edumazet@google.com, 
	parav@nvidia.com, linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org, 
	dsahern@kernel.org, kuniyu@google.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com, 
	stephen@networkplumber.org, xiyou.wangcong@gmail.com, jiri@resnulli.us, 
	davem@davemloft.net, andrew+netdev@lunn.ch, donald.hunter@gmail.com, 
	ast@fiberby.net, liuhangbin@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, ij@kernel.org, 
	koen.de_schepper@nokia-bell-labs.com, g.white@cablelabs.com, 
	ingemar.s.johansson@ericsson.com, mirja.kuehlewind@ericsson.com, 
	cheshire@apple.com, rs.ietf@gmx.at, Jason_Livingood@comcast.com, 
	vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 1:53=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 19 Jan 2026 19:58:52 +0100 chia-yu.chang@nokia-bell-labs.com
> wrote:
> > Linux Accurate ECN test sets using ACE counters and AccECN options to
> > cover several scenarios: Connection teardown, different ACK conditions,
> > counter wrapping, SACK space grabbing, fallback schemes, negotiation
> > retransmission/reorder/loss, AccECN option drop/loss, different
> > handshake reflectors, data with marking, and different sysctl values.
>
> Thank you for closing the packetdrill side, and big thanks to Neal
> for prioritizing getting it reviewed and merged!
>
> I updated the packetdrill build in netdev CI and looks like one of
> the cases is flaking a little. Since it looks like you'll have to
> respin, please try to fix:
>
> # 1..2
> # tcp_accecn_client_accecn_options_lost.pkt:32: error handling packet: ti=
ming error: expected outbound packet in relative time range +0.020000~+0.50=
0000 sec but happened at +0.015816 sec
> # script packet:  0.181936 .5 1:1013(1012) ack 1 <ECN e1b 1 ceb 0 e0b 1,n=
op>
> # actual packet:  0.177752 .EA 1:1013(1012) ack 1 win 1050 <ECN e1b 1 ceb=
 0 e0b 1,nop>
> # not ok 1 ipv4
> # tcp_accecn_client_accecn_options_lost.pkt:32: error handling packet: ti=
ming error: expected outbound packet in relative time range +0.020000~+0.50=
0000 sec but happened at +0.015800 sec
> # script packet:  0.181952 .5 1:1013(1012) ack 1 <ECN e1b 1 ceb 0 e0b 1,n=
op>
> # actual packet:  0.177752 .EA 1:1013(1012) ack 1 win 1050 <ECN e1b 1 ceb=
 0 e0b 1,nop>
> # not ok 2 ipv6
> # # Totals: pass:0 fail:2 xfail:0 xpass:0 skip:0 error:0
>
> https://netdev-ctrl.bots.linux.dev/logs/vmksft/packetdrill/results/482201=
/115-tcp-accecn-client-accecn-options-lost-pkt/stdout

Probably this is happening because the SRTT is around 56ms:

.050 * 7/8 + 1/8 * .1 =3D .05625 sec

So the RACK fast recovery starts afte rabout 15ms due to .25 * srtt
being about 14ms:
(.050 * 7/8 + 1/8 * .1) * .25 =3D .0140625 sec

If we make the SRTT 100ms then the fast retransmit should be around:

(.1 * 7/8 + 1/8 * .1) * .25 =3D .025 sec

So I'd suggest changing the timing of the SYNACK from 50ms to 100ms:

old:
+0.05 < [ect0] SW. 0:0(0) ack 1 win 32767 <mss 1024,ECN e0b 1 ceb 0
e1b 1,nop,nop,nop,sackOK,nop,wscale 8>

new:
+.1 < [ect0] SW. 0:0(0) ack 1 win 32767 <mss 1024,ECN e0b 1 ceb 0 e1b
1,nop,nop,nop,sackOK,nop,wscale 8>

neal
