Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3B63D9023
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774880253; cv=pass; b=Qj6uIyQEC3ld+9ws/Fk9vk8rHKouVuP+tYl7V9PgrNB4p3oNGGY3RO2CUssHxdcTTB/8d/uaAVhNVzUTRpkd4LPLEosOYqfFCXoWMDQ4ZK9Wn6iqbfja7krlJULNPTPraj2ZrUuwgkVJCji08bBFgXIC1lW1hcS5CYmQNkOFpp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774880253; c=relaxed/simple;
	bh=QgCXxbwIFTPJMoFfe4ZiNa8GU+aWKCMK6V94ynZLKTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ukUQFts1PGS9TST1ePgSKCJL4cosUVBQpcjVNCyLoBhI6eQhTcd/VHIdgRZylujXXOrsrFgWpHVGOkGVfvThOjvlAGLyYRKdSdv/G4vnYgqaB80O2v71L5d4eSBlXsVOgZtgGW1CU1ADSYeyHAlGS6sLk7sehEv6nUQ79v5zsPs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2Nkx212; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FO9qyTiK; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2Nkx212";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FO9qyTiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774880250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrLZv/brdC+ptmNYj2GqlLiIuUPLDJQFIDrzPiQMRYQ=;
	b=U2Nkx212WZvevQ4b+R0ee6yvMiHYgEmy7bOgNTafLk2x4KmpVn6ECp8jr8LealERtYkWsI
	9PGrr1288G5CuZfNftfe2VFO0RucTNC0kEkq3EvQOnZilYPRsU+mcOauYv/jeg9E93Lf71
	reIiN9W+ct1/Kn8NpSbWPiQeu8CF0Pk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-130vfarxNT-rvWZZXZcT_Q-1; Mon, 30 Mar 2026 10:17:28 -0400
X-MC-Unique: 130vfarxNT-rvWZZXZcT_Q-1
X-Mimecast-MFC-AGG-ID: 130vfarxNT-rvWZZXZcT_Q_1774880247
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b8704795d25so591131966b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 07:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774880247; cv=none;
        d=google.com; s=arc-20240605;
        b=hGvEeebsx1QIFEhcjldUlj8TcWKGu4OlJmLOBdhupaZ6sApYcsKmrf+94J4Amkl7qu
         eoU4D6YjrpxO+R6MzYGR+oOwwjfbxFDLZc5dJc+Ez+7P/u4Ltp9D/B8Vp0vTHwLQ4qCQ
         VhxzM75PIBJs+dZPJC8YkwBMihxs3XqFVT+FtlquUHmrH0v9o8waPB2ROW3FSV3j0sCl
         pkqUFAh+c6/vO2+VVl0lnASXanHJW6Z08ccoKgKeo0Qp2g5PMXcEoCyRNkIlgJBKO0QM
         7DuBZ9ebDB5DDhNWfEaSTXNQ60UumhYQkWdWTMfk290LRj+xeMp/NdQYdhDrujob9OSz
         cGdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrLZv/brdC+ptmNYj2GqlLiIuUPLDJQFIDrzPiQMRYQ=;
        fh=QMIos4lBg3ckpnISPn+WS25RCQrIWfHKLVCPqE2tp7s=;
        b=QQJoBspauax9kyaiaNMFM+slqjdT4c1LTWwkmTB1iY8g+xG8pK3lWSaOhbGNsKUoSC
         QuCjtn8SbyXfxp4b3vN4A7Ylkkdc+iK0e1Lg5Sus3h6hvLeahh8Mb0WI3dTC1EMzRXse
         Kkxt/MA2awH9uOQUiEESCGlg5jc37N/BBl9oBKgrbvJsiU/uKo86Jg/qAD+AMfkvJb+R
         ZfMzAQW1DDKEjhBIOhFeIRUjSCc/g4DvGC1PQ3sk1p3r0Hxz5n56c9rLj5j+LxWm7drY
         bxc/VNACxrdyeYV41cAM4pa86+PkMus6nPRsX70jNbhOFMNYAeHeuP8gvi6Cht/6fCI4
         MNjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774880247; x=1775485047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrLZv/brdC+ptmNYj2GqlLiIuUPLDJQFIDrzPiQMRYQ=;
        b=FO9qyTiKHPmk4QolU6nJloxg3csFFqJDSsoOOv41PiE+41Fv6Oeu6DWBfVKeuFPP2T
         nEJevx65588J6DH5raNdKnXA0/MwGm6yDKrXRASJ6sh0+5sGbXeAdemqS9Xo5Ck4mipx
         MSukqzNBc7h2SuPw8rfRled7CKETRjvqGC0kO17Gtm00aarMMTodQah7oaLV7T9jqgiL
         JeLNMJBDPb5XKLdeugSlZrZ2zj4RFTqRleChpBVCiPzEA8Esh/tCPC/xezTG78w/rL3K
         3Awwb5yzVhxSahnfnNYbHQhYjEzKPXt+724bYuDk3L14l4e7WfJrfG3Ok3xye1iYOrBk
         j0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774880247; x=1775485047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrLZv/brdC+ptmNYj2GqlLiIuUPLDJQFIDrzPiQMRYQ=;
        b=WWfFHyZ6shj9Puu42Aly0YbC03eWaGokt3cEMrckT/gdwitQrxCev01xJO5JqYxhiR
         Rp3Hr8cX5sVQZXtUXEWWhVXFzL2rW4xzBn26OkGbfgAxVswE9XFL6MflYhvbMqJuV7dR
         T1RatlHVtq2YR+XK7Ars8vroCALiL83A0L5vnmZLXLQoQEf4NjKoy8xWtbS+j6H46p0r
         NwApoFihb5eOAVemjPAW9SCz/z1v/oqwZfxKR440U6j+4zx/cNNc8EGF+uNrngGKPLml
         LuPOeEYFoC/Gy45r3VwTYinFdJnu2ZqBku8vz6nWm7W3VEmd1NFEw7Uqa6VZHA30UfAO
         G3FQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8eE1kPuugyrcSkrJOnjpXhCPS0pznAdYsw8Yqj6edpgRD/oQxwMfi7dNU6qaxRldpSzMohqG/H9Xe6Au8a/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKkiGHHhA8mRzZ5O0r3+VxdCITFM1LKVBZPbtWW7+vPUuJk0TN
	iyllzYzDWtBevRXyfE71nRApPEs5JdTYWGFBZTCdi8YMvGKW5npGM1aEDtGPW+mbimk6mTG3O1E
	8aC203PHMbYPMGzKmApKzap3qs1sTNMzjY47qMZL6loTL73EOoK5YMPQ82rorJKW8B9zbKLS3E0
	on5p6w6IlrFT3hiCrjf/74NFPyZGA4MzWlEnNmus4IIYqo
X-Gm-Gg: ATEYQzxTI6I98RomZDmHrUUfhJi3s1fqpZYcJnDzlSNPi/dSppeeADJ49nJ3ImcWq+d
	3MFOlQ7IR5abZllumTchFh2ntzyRBELiy4TkfGWNi74mhdX/LPP2mHqY6ozkbYV5XrRinPK/l8p
	g/coCTjfG36/1YlG9RAYe+MV+L9CJaKuKEzygff8uomKPZuX1dteGbgF863Lh0X6uIKwar3Nf3j
	g86xB0=
X-Received: by 2002:a17:907:7b94:b0:b98:7f7:50f8 with SMTP id a640c23a62f3a-b9b507c4640mr775490066b.29.1774880247038;
        Mon, 30 Mar 2026 07:17:27 -0700 (PDT)
X-Received: by 2002:a17:907:7b94:b0:b98:7f7:50f8 with SMTP id
 a640c23a62f3a-b9b507c4640mr775485366b.29.1774880246451; Mon, 30 Mar 2026
 07:17:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330113509.23990-1-yiche@redhat.com>
In-Reply-To: <20260330113509.23990-1-yiche@redhat.com>
From: Long Xin <lxin@redhat.com>
Date: Mon, 30 Mar 2026 10:16:49 -0400
X-Gm-Features: AQROBzBNOmpnx9PRLFRvLfL9PIycTYjajukeXqbEiKbsZ1DFIXNmMNDZelaH83g
Message-ID: <CAMApiK-USxtQNb17zq+8YO8eX3cDWEZZiQNt+Uvji6ryKuhikA@mail.gmail.com>
Subject: Re: [PATCH] selftests: netfilter: conntrack_sctp_collision.sh:
 Introduce SCTP INIT collision test
To: Yi Chen <yiche@redhat.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, coreteam@netfilter.org, netfilter-devel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 7:35=E2=80=AFAM Yi Chen <yiche@redhat.com> wrote:
>
> The existing test covered a scenario where a delayed INIT_ACK chunk
> updates the vtag in conntrack after the association has already been
> established.
>
> A similar issue can occur with a delayed SCTP INIT chunk.
>
> Add a new simultaneous-open test case where the client's INIT is
> delayed, allowing conntrack to establish the association based on
> the server-initiated handshake.
>
> When the stale INIT arrives later, it may overwirte the vtag in
> conntrack, causing subsequent SCTP DATA chunks to be considered
> as invalid and then dropped by nft rules matching on ct state invalid.
>
> This test verifies such stale INIT chunks do not corrupt conntrack
> state.
>
> Signed-off-by: Yi Chen <yiche@redhat.com>
Thanks for the patch, plase see comment below.

> ---
>  .../net/netfilter/conntrack_sctp_collision.sh | 84 ++++++++++++++-----
>  1 file changed, 65 insertions(+), 19 deletions(-)
>
> diff --git a/tools/testing/selftests/net/netfilter/conntrack_sctp_collisi=
on.sh b/tools/testing/selftests/net/netfilter/conntrack_sctp_collision.sh
> index d860f7d9744b..7f8f1b6b746a 100755
> --- a/tools/testing/selftests/net/netfilter/conntrack_sctp_collision.sh
> +++ b/tools/testing/selftests/net/netfilter/conntrack_sctp_collision.sh
> @@ -23,8 +23,19 @@ SERVER_PORT=3D1234
>  CLIENT_GW=3D"198.51.200.2"
>  SERVER_GW=3D"198.51.100.2"
>
> +assert_pass()
> +{
> +       local ret=3D$?
> +       if [ $ret !=3D 0 ]; then
> +               echo "FAIL: ${@}"
> +               exit $ksft_fail
You should not print FAIL and exit $ksft_fail if ret is $ksft_skip
(The test case was skipped).

> +       else
> +               echo "PASS: ${@}"
> +       fi
> +}
> +
>  # setup the topo
> -setup() {
> +topo_setup() {
>         setup_ns CLIENT_NS SERVER_NS ROUTER_NS
>         ip -n "$SERVER_NS" link add link0 type veth peer name link1 netns=
 "$ROUTER_NS"
>         ip -n "$CLIENT_NS" link add link3 type veth peer name link2 netns=
 "$ROUTER_NS"
> @@ -42,21 +53,51 @@ setup() {
>         ip -n "$CLIENT_NS" link set link3 up
>         ip -n "$CLIENT_NS" addr add $CLIENT_IP/24 dev link3
>         ip -n "$CLIENT_NS" route add $SERVER_IP dev link3 via $CLIENT_GW
> +}
>
> -       # simulate the delay on OVS upcall by setting up a delay for INIT=
_ACK with
> -       # tc on $SERVER_NS side
> -       tc -n "$SERVER_NS" qdisc add dev link0 root handle 1: htb r2q 64
> -       tc -n "$SERVER_NS" class add dev link0 parent 1: classid 1:1 htb =
rate 100mbit
> -       tc -n "$SERVER_NS" filter add dev link0 parent 1: protocol ip u32=
 match ip protocol 132 \
> -               0xff match u8 2 0xff at 32 flowid 1:1
> -       if ! tc -n "$SERVER_NS" qdisc add dev link0 parent 1:1 handle 10:=
 netem delay 1200ms; then
> -               echo "SKIP: Cannot add netem qdisc"
> -               exit $ksft_skip
> -       fi
> +conf_delay()
> +{
> +       # simulate the delay on OVS upcall by setting up a delay for INIT=
_ACK/INIT with
> +       case $1 in
> +       "INIT") chunk_type=3D1
> +               # tc on $CLIENT_NS side
> +               tc -n "$CLIENT_NS" qdisc add dev link3 root handle 1: htb=
 r2q 64
> +               tc -n "$CLIENT_NS" class add dev link3 parent 1: classid =
1:1 htb rate 100mbit
> +               tc -n "$CLIENT_NS" filter add dev link3 parent 1: protoco=
l ip \
> +                       u32 match ip protocol 132 0xff match u8 $chunk_ty=
pe 0xff at 32 flowid 1:1
> +               if ! tc -n "$CLIENT_NS" qdisc add dev link3 parent 1:1 ha=
ndle 10: \
> +                       netem delay 1200ms; then
> +                       echo "SKIP: Cannot add netem qdisc"
> +                       exit $ksft_skip
> +               fi
> +               ;;
> +       "INIT_ACK") chunk_type=3D2
> +               # tc on $SERVER_NS side
> +               tc -n "$SERVER_NS" qdisc add dev link0 root handle 1: htb=
 r2q 64
> +               tc -n "$SERVER_NS" class add dev link0 parent 1: classid =
1:1 htb rate 100mbit
> +               tc -n "$SERVER_NS" filter add dev link0 parent 1: protoco=
l ip \
> +                       u32 match ip protocol 132 0xff match u8 $chunk_ty=
pe 0xff at 32 flowid 1:1
> +               if ! tc -n "$SERVER_NS" qdisc add dev link0 parent 1:1 ha=
ndle 10: \
> +                       netem delay 1200ms; then
> +                       echo "SKIP: Cannot add netem qdisc"
> +                       exit $ksft_skip
> +               fi
> +               ;;
> +       esac
The code of case "INIT" and "INIT_ACK" are pretty simliar, please try
to move the tc command out of the case statement with $ns and $link.

>
>         # simulate the ctstate check on OVS nf_conntrack
> -       ip net exec "$ROUTER_NS" iptables -A FORWARD -m state --state INV=
ALID,UNTRACKED -j DROP
> -       ip net exec "$ROUTER_NS" iptables -A INPUT -p sctp -j DROP
> +       ip net exec "$ROUTER_NS" nft -f - <<-EOF
> +       table ip t {
> +               chain forward {
> +                       type filter hook forward priority filter; policy =
accept;
> +                       meta l4proto { icmp, icmpv6 } accept
> +                       ct state new counter accept
> +                       ct state established,related counter accept
> +                       ct state invalid log flags all counter drop
> +                       counter
> +               }
> +       }
> +       EOF
I think you need to check if 'nft' is available
Either in here by:

if [ $? -ne 0 ]; then
        echo -n "SKIP: Could not load ruleset: "
        nft --version
        exit $ksft_skip
fi

Or at the beginning by:

checktool "nft --version" "run test without nft tool"

>
>         # use a smaller number for assoc's max_retrans to reproduce the i=
ssue
>         modprobe -q sctp
> @@ -64,8 +105,6 @@ setup() {
>  }
>
>  cleanup() {
> -       ip net exec "$CLIENT_NS" pkill sctp_collision >/dev/null 2>&1
> -       ip net exec "$SERVER_NS" pkill sctp_collision >/dev/null 2>&1
>         cleanup_all_ns
>  }
>
> @@ -81,7 +120,14 @@ do_test() {
>
>  # run the test case
>  trap cleanup EXIT
> -setup && \
> -echo "Test for SCTP Collision in nf_conntrack:" && \
> -do_test && echo "PASS!"
> -exit $?
> +
> +echo "Test for SCTP INIT_ACK Collision in nf_conntrack:"
> +topo_setup && conf_delay INIT_ACK
How will the error returned from conf_delay() be handled?

> +do_test
> +assert_pass "The delayed INIT_ACK chunk did not disrupt sctp ct tracking=
."
> +
> +echo "Test for SCTP INIT Collision in nf_conntrack:"
> +
> +topo_setup && conf_delay INIT
> +do_test
> +assert_pass "The delayed INIT chunk did not disrupt sctp ct tracking."
> --
> 2.53.0
>
The current kernel will fail with this test case, please hold the patch
until the fix is submitted. It is still in testing, as you already know.

thanks.

