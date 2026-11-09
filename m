Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794247955;
	b=KhxtMUzrXQb0J9nC4vVEuFVTdCe77skuI7ttaBhNvaXM/hJXpng4S+2l02VMQ+18XZk/
	 J/jmcXskcebUYqWfWVaVyYAkFqasofS+n8vneTdeO5AbbHcgAnKBC/8Uf68oB6IMfhjka
	 bdEhuWqAPYbMwGJUWA1v1D2jUIh8RLWZkcsdxBbXQkD/Ti1xCXeAxnKDhsENi2x9NK4Lr
	 HzYxxLtwEnoknQUQpkcnZiprJ+CtMxBJI251y1eqFcEAW5icyMZBKVRYr9ZG/YUutcrdb
	 j8ViUvBP6sBAxrWshI9IDKakaaRA0/bO3pTtboNA5vABYHmfqxGBFWSkESj1a+NtJ+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dGm8nmvLy6E2sFmoRptp+D8SP6z/MqgZLc9I2o+BU6Y=;
	b=rmk1CvJl3wKQUdlYq7LhdjJCGXBYrJoX/loT25PLLM8GRVI8S/AySK0r0I6obtM03D/I
	 yVm6IsapZkyH3fMwOh4b6qiPcngIQPJsGkPdmORjA8XVv0Aap0AZEfLPxbqtKl1Xun0Sy
	 clxUh0W4pcfVXcChiuYqJwgFQV0MpwQoC8jd4EtBQlHeT+DNX77fZH9M2ygRDhFjw5fO+
	 JaUIbv5VEhqCCZOoayK4cUMcXeX3eBoKDRD85WznQvDK+2x2Dn3t3fwQbq3H4sIWhHMYK
	 94pxK8RdpWq1H+WNk9nEaXQvesqWCcaoN/O9ewLAubLuG7hK+pPL7CMNvJk9r4c6v/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PSUh0CjE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52944606A31C
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 18:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52944606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PSUh0CjE
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5383c97c8cfso6371cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 10:12:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794247953; cv=none;
        d=google.com; s=arc-20260327;
        b=pb6U6JgNQMhd4maDfgYfWVt3wsfC762ThW/GVzG6p3Gdsax8vLwUQ0pu7RtC2om9xH
         WHAIpS44fCL26YMRn7BWXmMnpx2MdPIQOSo0IR5RX3FwlQJmvdOuHUwBrMIjm2SFkZtJ
         agRETloKT6dNtGPBu45hPyU0m3KJEydjIYEsWlS23nRFHdPcEIJjZ6zDoylec0tuFDi6
         fdXp8crHAaqRN1wbYXAF3Sfacf/NSqNlJlMdhUBtxZ33AMcN8bqEIYXHKPSInq7fCSkq
         uTxuNYAJYvEMsAl0ZtMNfHmhyFjVAYx6s09lxkIH8/TMCERBPaQet6dfKU0YkXskZtJV
         yw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dGm8nmvLy6E2sFmoRptp+D8SP6z/MqgZLc9I2o+BU6Y=;
        fh=u+NQNIVaz/wXv87hFIIKbyYWVCK4Nxb+YzKAv6+GMTc=;
        b=KuJWoQiTsQWXyJiDuRcw9UVqJ3s3mo4fDYEG4Fa9AYVgmV2KUcipapvuFrJNFQcJAg
         4FoxIqZe6/dn9SMC86A86+o07xWpCX9zG8YcEaEY0tSVW4HffPEwKo8xs8CSzvycsI+b
         FuAF2318AhfuhOg3OLPMLdY+TzPX2+HuceTwy9IkEo4Ztv3wsBdZ82YKaoLUl1jf881S
         tGDrH6rAUKol1ZbFx+fXdyAT0acp6MmXdYitEzmjtLuAwrGkzt7tTnRLbo7Jweyv2jYD
         wpkVqD+jkyk4mxYhXkVyKLUyyv5WDJE9zCHGBsJyIL57I0xg4LIG4uCiH18amWKNvphE
         3MpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794247953; x=1794852753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dGm8nmvLy6E2sFmoRptp+D8SP6z/MqgZLc9I2o+BU6Y=;
        b=PSUh0CjEMxfsN7BHYMDVYvAEhdCcCyr1A8NrN35WuqIsTR+9oBEIETRFwRAro1JVm3
         MV1+5v+uMk+26jLTq5uauyK8cGUBpvkuLmmMzmvpKYsVEfLOqM2QWxhNxm1WSDiG39Hc
         LTAHnyvY/X2rS+nkN/lKmAHpLiddGtkYrHVxvMKhJ1moyY8860W6RLabyNh1z4jjpx9a
         Lz/KEShc71fQvc5/8eK4Hguy0S8PE5R3o4K2oCTZ3AWeX1mUJLqTjoK1wyGAzD8xoDjv
         AB3YDwby5q0KbeUR9WvSXdj+JayLNpn2bGQrzWfko+Ha4+FTzwUgMYg6unYT0fWJaxiG
         CyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247953; x=1794852753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dGm8nmvLy6E2sFmoRptp+D8SP6z/MqgZLc9I2o+BU6Y=;
        b=pESu+GqBboTgrb+CR1RdyipCG04D9gpusJ/FkrjkAzAi+nrYpmJiEqb4tySt8T/7YB
         2RoElDj1NAfaV2Och5Trmr8ywyL811sDipPZBIBXrpYyAYwFiWhylPjWOVDvgKc080In
         Rw7gYOkc59Z9ApMVTZZj6N4YRe6SDGt3zWh2BH7+KmLFVOBJfnRy5x/gYLUnsB+UjD+D
         taXlduLDJw89KjQf1KN0uRthauWtjkjxDt2ZCo4gblFqyXhISQlQGbjItvNSApz4FF+9
         0NrVxt+bNekhyzer751qVNDdK7aOzWEC0a7ceq7XlGTNkLdIAPh1bW5AUnq+y12K6wiP
         BQdQ==
X-Forwarded-Encrypted: i=1; AL+hErGhuwPJ/jqW9YUN8X/ftC0oNGrztTYpN+qyAoiqrvgqQy1+08zlnvkOMfnXufNB2BQNUrB89rpzZFdUBGNAbHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kKb11Pz1EUwKUP15GcCneCdIZLClXK+jGR9K79LuQPk07FqCg
	JejwN7SvaM1Lu66CAea36YHHyahPojN/AZQhCx4f7p29f87KdPja5YsmLfKOSsrqj456SmpCMPO
	DeANjOmXqbSd17YEuU/jJzVkmApoBELatWcE1aVte
X-Gm-Gg: AYBFou2yvnFQwhrf8bJMe+rPDaJXBIcWZtLZkF4vpv0lGPG/z2G+KEeqLPolF2Hfk4t
	lobCjARQnCenY0qQpTG8qbTC0exEsxa+E53GeQ/SJhgclCo1mUCIjJjctJvBPazUbnBnjcJAFq+
	j8D2c0C/dvJs3AhIl6FbGHVqsPwI0o6dRTfuqx8ZQORPcoHVrs/WaSevn4qs1MMDj4n/rwZtGkH
	aIKJZrIjdCqHcY/PUgbbiTu2U8Ya4zBBEpT7bRKWVLvZFVziEdYooXWKSxovIE+2cTnaNRFVdZn
	LbE7cyLJQkTY7ejfqMYowWVpE4Hn6aIfSPkvOflmfoU7U1SRPY4Hbeb2YoxjQT54mzu87iUE6Ke
	TWvxqKTAQAgfw8kqdktbENtAL/W6vj5o5z88f1Otxl4c6SH7mMI56KUx5DnUjT9k6QXZ851GKDo
	2xi+IwcLClflnovvExWMUVzTl6IbakymNiU7T3V/gY0vtgrDw=
X-Received: by 2002:a05:622a:488c:b0:542:fc60:fe23 with SMTP id
 d75a77b69052e-55530d3d62amr54161cf.3.1794247952273; Mon, 09 Nov 2026 10:12:32
 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-mtu-probing-series-v3-0-dedfab25d641@gmail.com> <20261110-mtu-probing-series-v3-3-dedfab25d641@gmail.com>
In-Reply-To: <20261110-mtu-probing-series-v3-3-dedfab25d641@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Mon, 9 Nov 2026 13:12:13 -0500
X-Gm-Features: AclHuK-E7FZmMgLaCJxXz6hIu0FtIdqq3ijAk57SK8zqY5F6VRotgKBpxs38suI
Message-ID: <CADVnQykoJWJL+vZ9GC=RqZuiSEypNtmTONBzV7XRQ1jsXy0X_A@mail.gmail.com>
Subject: Re: [PATCH net-next v3 3/4] selftests/net: packetdrill: add TCP black
 hole detection test
To: echoowall@gmail.com
Cc: davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, 
	shuah@kernel.org, kuniyu@google.com, horms@kernel.org, kuba@kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 11:44=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> Black hole detection (net.ipv4.tcp_mtu_probing=3D1) has no selftest
> coverage.
>
> Add a test where a full-sized segment keeps timing out without any ICMP
> feedback. Check that the MSS drops to tcp_base_mss once tcp_retries1 is
> exceeded, and that the smaller MSS is also used for new data after the
> retransmission is acknowledged.
>
> Set tcp_retries1 to 1 to keep the test short, and disable TLP so that
> every retransmission comes from the RTO timer, which is what
> tcp_write_timeout() counts.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---
>  .../net/packetdrill/tcp_mtu_probing_blackhole.pkt  | 37 ++++++++++++++++=
++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blac=
khole.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackho=
le.pkt
> new file mode 100644
> index 000000000000..f10dbb36dd2d
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_blackhole.p=
kt
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Test black hole detection with tcp_mtu_probing=3D1: when full-sized s=
egments
> +// keep timing out and no ICMP arrives, TCP falls back to tcp_base_mss.
> +
> +`./defaults.sh
> +sysctl -q net.ipv4.tcp_mtu_probing=3D1
> +sysctl -q net.ipv4.tcp_base_mss=3D1024
> +sysctl -q net.ipv4.tcp_retries1=3D1
> +sysctl -q net.ipv4.tcp_early_retrans=3D0`

Thanks for the test! Though because of all these sysctl settings, this
is testing a fairly non-standard configuration. That's better than no
test at all, but IMHO it's more important to test the default
configurations users will be using.

So I'd suggest renaming this case to be something like
tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt.

Then I'd suggest creating a test like this, but with only the following set=
ting:

`./defaults.sh
sysctl -q net.ipv4.tcp_mtu_probing=3D1`

That way we get test coverage for the most important scenarios and
code paths, and can understand the behavior that users will see if
they just set net.ipv4.tcp_mtu_probing=3D1 and do nothing else.

Thanks!
neal
