Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D423EFD27
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 15:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081779; cv=none; b=OMBVdP3jSsxWGOzFA6Op9eizGxbkpHYRYMHBrWX2KKTs1rBoB9uIo4WhrfGywtwaTp6UuD3VYJn+uOPNELV+XoT5WqKb51TIyJFotD2zcuzC54pS9/RAfRREZ4nuoaXV6f4olL4PL+p7d+fUzRBlWEoNOa/Cjm1/L9Nw214Ljfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081779; c=relaxed/simple;
	bh=CwP7g+L7tmTM1gOICXchU65OK9ZzlG0f6YkTuUwv3XI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QDeMOwqRUHcjfofU+6Hc/6V0H+eHj/To0y0wyP6dZrHHuQj/hOddm/51JcNHNiJQGzeKA6T/hhK/X8tDf5hvMk7dX0DbuL1suBjLVi1dfIb5nmqcUdYfgKugwAPqE01xOPywc7CFCdx4UPWtLbwtt+/M4H0Fpim9moqUjVVUZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J/9Gf0dp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J/9Gf0dp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778081772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P0UoDCQban7BwMooeGuUu7b8/86Tvw53i5NmMB+ICeI=;
	b=J/9Gf0dpu8vRPt9NfUGCYwWXvoRWWdcLzQjTcXh5OzFMI4LwRb+gd45k86FYxfpApcDivm
	QnVbcrjm2pmF6byBRLOObLhagBtudlAJmdj//7YbmKCNoXl+cM8k9Yxpfr6UsnIit3exTw
	bbLzg3JyTYjZ2zeUU4OmuQLYBgdLtCw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-179-Oj-mcXI6Mm21pizt2v4p5w-1; Wed,
 06 May 2026 11:36:06 -0400
X-MC-Unique: Oj-mcXI6Mm21pizt2v4p5w-1
X-Mimecast-MFC-AGG-ID: Oj-mcXI6Mm21pizt2v4p5w_1778081765
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C3E9419560B4;
	Wed,  6 May 2026 15:36:04 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.65.142])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 32CC318001CE;
	Wed,  6 May 2026 15:36:02 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Minxi Hou <houminxi@gmail.com>
Cc: netdev@vger.kernel.org,  echaudro@redhat.com,  i.maximets@ovn.org,
  davem@davemloft.net,  edumazet@google.com,  kuba@kernel.org,
  pabeni@redhat.com,  horms@kernel.org,  shuah@kernel.org,
  dev@openvswitch.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/2] selftests: openvswitch: add pop_vlan test
In-Reply-To: <20260505124957.1239812-3-houminxi@gmail.com> (Minxi Hou's
	message of "Tue, 5 May 2026 20:49:57 +0800")
References: <20260505124957.1239812-1-houminxi@gmail.com>
	<20260505124957.1239812-3-houminxi@gmail.com>
Date: Wed, 06 May 2026 11:36:00 -0400
Message-ID: <f7tjytgtusf.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Minxi Hou <houminxi@gmail.com> writes:

> Add test_pop_vlan() to verify OVS kernel datapath pop_vlan action
> correctly strips 802.1Q VLAN tags from frames.
>
> Test structure:
> - Baseline: untagged forwarding validates basic connectivity.
> - Negative: forward without pop_vlan, tagged frame is invisible
>   to ns2 (no VLAN sub-interface), ping fails.
> - Positive: pop_vlan strips tag on forward path, push_vlan
>   restores tag on return path, ping succeeds.
>
> Use static ARP entries to avoid VLAN-tagged ARP complexity.
> Rely on ping success/failure for verification =E2=80=94 no tcpdump or
> pcap files needed.
>
> Signed-off-by: Minxi Hou <houminxi@gmail.com>
> ---

Thanks for adding this.  I'm still a little unclear about the explicit
modprobe for 8021q.  Is it really needed?  I thought the request to add
a vlan tagged interface should auto-load that module (unless it is
blacklisted or something).  I guess this is an attempt to short-circuit
the skip, but maybe it would be better to configure an interface and if
that fails, then either fail the test or skip the test.

