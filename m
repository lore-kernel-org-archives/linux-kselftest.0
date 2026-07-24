Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BD838B7C3
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 19:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919733; cv=none; b=ujnQBMHbm7n3+k5urZMto4o1mNL97+R5I7HlmxtcK4esrT39vAGNze9syYnNvy83TOI1V6VysmCDtieLKFlfgrjeqgKiDNOAE/dfvW8sA82FXCJG8xxymH1Gl3JkESU10g0onbmkJVZJEPwMQZvcWR3ey70YnkRI4J9hJtrSWQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919733; c=relaxed/simple;
	bh=AIknAwLjNNhNzgkjlWdV0BzDVeCjKIU8hN37Db4RQ98=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qlb+YYfseb1CeUZbGCW23Cdi4bPP73NbxxYfFQt4RRCVZ+SbB7XZFFJp/Nqn378w+KaHJbvUAOAAG2JEsjsMi3JP7qUy8dXz1dE5TURoSfxEOukaWM4cza1lprodF1gVD5F75JTWk17HzUiS9PYSuWOrWaW9iOuYWbKuYGTb9+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XklI3HTq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XklI3HTq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784919730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rupmx0t4TyAlKUxk1plcCsYbfW2u8U2YIdklHA7k+p4=;
	b=XklI3HTqym1XRmYD7plQF9x/AmsmPVcHCn7PBsV3FlWkGFI8UUvD2lhZBLthJdUE7Rpvh/
	HgsV04frsa7ZYLkbUclslBw/sMxn3Vlc/GF8yhBbILYaBcLT6Kg8tp2sqHGC2fKqXCQCec
	u/HwNLo/dv1GLB1ma/LnzwE5sLTpT/U=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-kV6jx0yPN6mz7TIOxA7c7A-1; Fri,
 24 Jul 2026 15:02:07 -0400
X-MC-Unique: kV6jx0yPN6mz7TIOxA7c7A-1
X-Mimecast-MFC-AGG-ID: kV6jx0yPN6mz7TIOxA7c7A_1784919725
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 22D56196F770;
	Fri, 24 Jul 2026 19:02:05 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.81.35])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7BDEF1954216;
	Fri, 24 Jul 2026 19:02:02 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, echaudro@redhat.com,
 i.maximets@ovn.org, i.maximets@redhat.com, dev@openvswitch.org,
 linux-kselftest@vger.kernel.org, shuah@kernel.org, horms@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [net-next,v6,1/2] selftests/net/openvswitch: add SCTP flow key
 parsing to ovs-dpctl.py
In-Reply-To: <20260724150624.3457427-2-houminxi@gmail.com>
References: <20260724150624.3457427-1-houminxi@gmail.com>
 <20260724150624.3457427-2-houminxi@gmail.com>
Date: Fri, 24 Jul 2026 15:02:01 -0400
Message-ID: <f7th5loxlcm.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Minxi Hou <houminxi@gmail.com> writes:

> The ovskey flow-string parser has no OVS_KEY_ATTR_SCTP entry, so a
> flow string containing sctp(src=.../dst=...) parses without error but
> silently drops the L4 key. The resulting flow carries only
> ipv4(proto=132), and the kernel rejects it: match_validate() in
> flow_netlink.c requires OVS_KEY_ATTR_SCTP when the IP protocol is
> IPPROTO_SCTP and returns -EINVAL for the missing key.
> 
> Register OVS_KEY_ATTR_SCTP in the parse table and add unit tests
> (runnable via ovs-dpctl.py --test) covering SCTP and the neighboring
> TCP/UDP/ICMP/IPv4 key parsers.
> 
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---
>  .../selftests/net/openvswitch/ovs-dpctl.py    | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)

[...]

> @@ -3165,5 +3171,128 @@ def main(argv):
>      return 0
>
>
> +def _init_ovskey_nlas():
> +    """Initialize required NLA classes for ovskey parsing."""
> +    nlmsg_atoms.encap_ovskey = encap_ovskey
> +    nlmsg_atoms.ovskey = ovskey
> +    nlmsg_atoms.ovsactions = ovsactions
> +
> +
> +def _parse_flow(flowstr):
> +    """Parse a flow string and return the key."""
> +    key = ovskey()
> +    key["attrs"] = []
> +    key.parse(flowstr)
> +    return key
> +
> +
> +def _find_attr(key, attr_name):
> +    """Find an attribute in parsed key."""
> +    for attr in key["attrs"]:
> +        if attr[0] == attr_name:
> +            return attr[1]
> +    return None
> +
> +
> +class TestOvsKeyParse(unittest.TestCase):
> +    """Unit tests for ovskey.parse() flow string parsing."""

[...]

I don't think we need unit tests for the unit test... That seems like
extra working making tests all the way down.

Maybe someone disagrees, but to me a test case here feels a bit
excessive.

