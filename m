Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794778482;
	b=yM2jyb1YxpIDLIdnDImEHlXtxP0AnLhtjQb0dM6AP3sarimxwC+fJp69LkPfmJJJsLgh
	 lGE18MA82/RiuF7/EUF7ehDQQa1QNySvrfk3YybybP8C3FvGFG+wBcCqwCUvWIk3PZU9R
	 KNOOgQJQNK3DpRm5VX4acWDy9SQ4A5uf8Y2F2VagwIg11Kduwo9hjEq4eCQQOLr4e4CM9
	 aPaZnh8SyHGxS75UHqZAKVJ1xcY1ihE3IDiyxaRfX8bYlBXV17WuTJst3YKtMFRnM8ymY
	 PBrxjtxzOSgDU5QfByrXjv31TowQuFRvxURldIJNU3xHOXMCXz559q0MbXcUcad/2ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
	b=KmgcMQZ+FdRhBfCfeaObzQisPChmmDKk76v5kJ4VlhFXXJQOfCcNXXq27Sk2po/r7t5+
	 Zy55ZOkjj4YGv74e1McJcBPGs2nJFauXg2CNXAAJzRzX63sb0N1tFwbCj4/qbGjUvIYKs
	 QKWxCCM/Gcle7CmhzUKdhTF3npNmn4D53oWo7ByjD37nri/EkadcLb41WwHBDt+ClVvM4
	 6V8uOfjUyQk7q1J2wS6gXEDkwo5RfLEJo1LDn9b16cdMXAw0ER8U1nFHYTSZjRSZ7k5JE
	 0zYRiiWmpv43O0IA8IPkoipB7N3L+rnBtl0F2vPpUYIpDI0qAkuuc2W7O+5+Ub/7xoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=LQb7bpGA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F195606A333
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 21:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F195606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=LQb7bpGA
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b19e291cc6so3671870eaf.2
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 13:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794778481; cv=none;
        d=google.com; s=arc-20260327;
        b=Q6bvrlNqYEDrb2kQEKNQjbAXqQxFadFP+mZfncpHgVJttFA85ml5x4FImrvv0LFc+N
         cnY753+tVwzHNYf1jn/8+26RoHKXl6CkR4dcFDap90Vh8PQxG8nAhL2y+bwbUGF6C+ub
         6VGjq7EanVSRzYSeDRu/PX7Dvu1PBO5TwouDscG+w7gbi/FFhYbA2f0+axR1cKYD5iAG
         ORXpRR7JHSMEQVc2MZmzr0D6p7+KlgsLIhTsUTHusb0liUXl2EPTbyEJvtj8HO3Gvgvw
         Obwp0s8spJfdh8jITTs+cy0ZxUWsV+ivRRQbFJBKeqz2tS5/1K1vbJRhgK4MPk3dAeEF
         Hmig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
        fh=hZrNL7LmK/AfNX1uL5xSVIMvEK3Zr0z5i5PCZHByLk0=;
        b=kE8qYIoOEhPXjFcIFqrZmCO3N6H/kMz2tsP4MKuTgCfOlw3bFEpnsNwyzebsAjYtXI
         7hTI6fdEiQOaTPr0W9UFwxL4tipqFDjelPXtAV5Eh8veJAJO1KJT/AFcFaL2DJUg1WLM
         orV5cMYJ3zwk7EDCcDtII3pbXmtpSQvheBoty9vpUSaT/pAOG40J2fK79CdK5WHJy9ky
         DmkXxHTaSdrdYUmZ+lyFNQyWvrDvHW1fIIcrjO3GHKGd8GVapMKQCeNQ6Gc6gi5aRObi
         tBnnhZDc+2SLnwT2nOLGfoOZZgeaM9vPHCQLQ/9wRSuacRPitv4fxPwRS5sCxJvj0Rb5
         Qa1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794778481; x=1795383281; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
        b=LQb7bpGA03szUtIQx3bHdBEh40GP6gIqmFccn3+VEv955kr1PLbIVOR0uUlP87lFx7
         4/Dra29lac4PuGRuM3R/yXVFBmgDTi6WO6vI85vAlw0n1V34Jf/hJpYsAkBnMRiQ6mqh
         V3GMoen874LPOwBhk897GpaUo6XfRFJm+vBswGdzMb2I2uQPn0fQN6MCPQCsjuKV7gfF
         2GSizdod0eYE/AaE3zaC/iLIkeED6WCx5HrEXxJh4s8Cvi4lLu6aOzwNQot2VdIdJN3y
         8Bx0WHoW4EgCtFvY1FZetZuaNHmmrlxLT56LB0/prybZyypsd1+ABS5X/os09adxvk+0
         glnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778481; x=1795383281;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cs9JHELr5d8wuCO3bjOm1h46Bh/lIS6/9xmpt7kk/0s=;
        b=h2yVC44cA9murOm/DLMwR2JTUEJdTR3lbJC/994PBExQ6CDbrqwRKDPBh2IcSc/ncd
         C+00s4bSDEGR6aAbwfNp1S0q2v1pTwj+dgigXY/s2qDLrYxURqW48aoDtbVJxdM2A9Zj
         MIYODKOld2nHpyz7AX75Fw2i7/tZHrwv9O6Q4Bmj+ikOr49m+5isVipeA5XxYoF0FiaL
         qeGSEwe3I7kEoweIQ3NfTmZ/56eluPwfiHAPGqBLIIZI+b+ml37AfGSvA41Rd8zvTNR9
         ooD+z5uaeg9qEWtH3GjsJfNAlcoO2ZrZm95V6zJ+GOkxIu5YHLZSJEeSHaoQcotmTWlT
         Lpdg==
X-Forwarded-Encrypted: i=1; AL+hErFxQj9bqrhHCmtxub4p9AmJSaHDBnSZ0S2vBpbisDWz84VAi4FXTQHUEQwQTCFM0TnxKVQY7565LoJt6DDpqS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cbtYWiq6S1US8cakLafs8zsdVZ+O93M59BSyYvXvExZ0amcwP
	MULUNkmpTM5N6w6NJC6zhAqWZPc3B/c/NhFrwspPFfCPoyaxsHKvPAY4vylebHrAzSIiuQLw70g
	A3Nd02nEYGKm+Hg1QrckN7iHiDGjTEFMBPwrrG8epYg==
X-Gm-Gg: AYBFou1HDYBLhR5CgX9ILTFE050cBH2d/tA65pdqyE+tGEp1rK4Ywt86tDgW+WGClUJ
	WNjA5n7SfHZq0R8hrawd7X2IIFk0qvOZWUmlxdgmSK53cK9j14CQ6O8lB7NEYKVFC31/Se00+ls
	mBKEpGNsdYOve/uScFlvvyU7roBJ3vRO2eI3LNR6p8J0UC02CwxS1SO7/k5IPBjxjiqM462vx2a
	Cqyd+K+YvrIzaGEKeGzlPGkew4SyBIFoe3LagohZnTGkFWUmNF4HVmZhmb0rZU2HV8PYjJO6DrE
	x1XNzph6k0iXbl3nJfi4wB8Q9LGjkiFP2oLMZyl9/bw1vXAgVlFVZYocAdj3eHNNuyMDp4TmUpQ
	B0pO21AnRGTwsLBu+SEzdUat/coj3l7VuMPn1yOL1YGT0QjCG0lscs+HBBFyiX0SKF6UcG2hjoG
	3Dxuqrnic2ig==
X-Received: by 2002:a05:6820:3389:10b0:717:866:abde with SMTP id
 006d021491bc7-71ab50b64f8mr4048862eaf.50.1794778481265; Sun, 15 Nov 2026
 13:34:41 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115212117.48496-1-emmaonana18@gmail.com>
In-Reply-To: <20261115212117.48496-1-emmaonana18@gmail.com>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Sun, 15 Nov 2026 21:34:29 +0000
X-Gm-Features: AclHuK-PPhL2FyJA0xoMqtYefnBbjo3uLjHDcDBJy-SQemPSC9ZW6IQWHZkbIBg
Message-ID: <CAG4wq-exUYFvw4i=gQZhwC8fF3tnhmOMtv+NceYTBEx_TO+F7w@mail.gmail.com>
Subject: [PATCH] selftests: net: veth: propagate channel-check failures to
 exit status
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: kuba@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 15 Nov 2026 22:21:16 +0100 Omokefe Emmanuel Onanaroghene wrote:
> Fixes: c017800af5c71 ("selftests: net: veth: test peer ndo-xmit after GRO toggle while down")

The Fixes tag should point to the commit that added chk_channels():

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")

c017800af5c7 did not change this helper. The bug is present since
v5.15.
