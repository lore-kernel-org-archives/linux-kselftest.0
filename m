Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACCD389471
	for <linux-kselftest@vger.kernel.org>; Mon,  6 Jul 2026 15:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783351639; cv=none; b=k/TRgD2ax6g/J1nwc/2idNw8lpC41BQ4K99PoIr5NWdHVVgUPSZespKpIWhTBJ9P+L3Fe9TCl9dDjRJ3Sy7CedgqLnJhhuoxwqOppmoSaZmZTDq87OsfT2BRj8QeyjnA2VeqdPZjJK87iAPk2INYqp+wIRNsrEnV76g5HXXQ2RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783351639; c=relaxed/simple;
	bh=lSoboED2PAHrqCkmDz/2UOnv2dxYPKKdRMpTQi4HUMo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IM5gjltIhXHVFucqtE4RNXooeZ3J97qkJVZ1TPvBWv9+5KVKe2b9cakMS4+ej/hB7gPF/qes6/Y5ol930ajTQxexSkInlRxjlxK5vOEIJ+eehR4a826wvBQbNJsSXcMN+XFJB9PXhwlOk+BiGYlKuLm83IB00IbYwvg39tfq34w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hoYKJ12i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hoYKJ12i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783351637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lSoboED2PAHrqCkmDz/2UOnv2dxYPKKdRMpTQi4HUMo=;
	b=hoYKJ12iw6svMR/l8L8ehDql8YBRpHW93wG+z8Cia6K7AGrBHiF0zMOsq4KaZ903MTTAHy
	WmNlEDPX8Gq3HZa42usOUY8VfwqaAWLfFnyTrzXjuUx6gaH8uWnqIKK5lOkeFQYbIXMzvz
	gXh+zrUoekmjAclgFJ28pPdYmSOhY88=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-101-VHLqI0jtNIedTqvshkqKwg-1; Mon,
 06 Jul 2026 11:27:13 -0400
X-MC-Unique: VHLqI0jtNIedTqvshkqKwg-1
X-Mimecast-MFC-AGG-ID: VHLqI0jtNIedTqvshkqKwg_1783351631
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 06BBE1955D8E;
	Mon,  6 Jul 2026 15:27:11 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.81.35])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BEAC18005A7;
	Mon,  6 Jul 2026 15:27:08 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  echaudro@redhat.com,  i.maximets@ovn.org,
  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,
  pabeni@redhat.com,  horms@kernel.org,  shuah@kernel.org,
  dev@openvswitch.org,  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4] selftests/net/openvswitch: add ICMPv6 echo
 type match test
In-Reply-To: <20260702075044.1176798-1-houminxi@gmail.com> (Minxi Hou's
	message of "Thu, 2 Jul 2026 03:50:44 -0400")
References: <20260702075044.1176798-1-houminxi@gmail.com>
Date: Mon, 06 Jul 2026 11:27:07 -0400
Message-ID: <f7ty0fo16lw.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Minxi Hou <houminxi@gmail.com> writes:

> Register OVS_KEY_ATTR_ICMPV6 in the flow key parser so that
> icmpv6(type=...) can be used in flow specifications. Without this
> registration the parser silently drops the token and the kernel
> rejects the flow with EINVAL because the expected ICMPv6 key
> attribute is missing.
>
> While here, add convert_int() to the ovs_key_ipv6 and ovs_key_icmp
> fields_map entries so that specifying a field value produces the
> correct wildcard mask. The IPv6 flow label uses convert_int(20) to
> produce a 20-bit mask (0x000FFFFF), matching the kernel constraint in
> flow_netlink.c that rejects masks with bits 20-31 set; byte-wide
> fields use convert_int(8). The ipv4 counterpart already does this via
> convert_int(); the ipv6 and icmp classes were simply missing the fifth
> tuple element. Existing callers that pass empty parentheses are
> unaffected because convert_int("") returns (0, 0).
>
> Add test_icmpv6 exercising the ICMPv6 echo flow key. The test uses
> static neighbour entries with nud permanent to prevent racy NDP, then
> verifies in three steps: install icmpv6(type=128) and
> icmpv6(type=129) flows and confirm ping works, remove the flows and
> confirm ping fails, reinstall and confirm recovery.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

Reviewed-by: Aaron Conole <aconole@redhat.com>

