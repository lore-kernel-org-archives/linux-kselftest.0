Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0673115B1
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 13:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804557; cv=none; b=SA4jLfYJTJJRyF+ExFs9teLcvnSLj9fcudRCFANb9y2J0sVA5YHrn+FkEmUsRLrtCqZl5Rql61j4/gkcU+tNcR1DmtMKNraTmihMapDu0W37DleZHDWS2LUqLY3mL8KW3sJLQsfTiG3YdEY0hGkGVKhyN62cihr3rVSDTo4aKmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804557; c=relaxed/simple;
	bh=PRcuS7YX9o7ie/hBlDl9MuX0mN21Cj30bZmcUk4lxoI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tV8VA/K3fDNklXsHGg1wEfNaDm5uX0EH63/o4MGUwL5QVpD6QRA05cjH0ie2qdKOanBCFUCcaR+GbYvrxBU41x3eUgihEAWcnl5sEn1hdSCVRC6rWR+M1YJCxJXGKVJBL7Mg7IgHkmUnCf0MtXDp6lzDf4mX4HNz2sB9QJbWKW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HAv2TaRi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HAv2TaRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772804554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRcuS7YX9o7ie/hBlDl9MuX0mN21Cj30bZmcUk4lxoI=;
	b=HAv2TaRiG9RVnJwRfEvUqvlbXy0dgakVp6Clfvt90oAm6xfBJe1g6ViLB9hPVcA3hs7JKB
	sMLfzqCKCNfX5Zhc69+Ok/pCF1wiSeEndOz4/8ap/PHIlrxlxB/br9ddBgUE5c+Cjxy6E8
	3wpr3Lbf7fsUVSwX7g0EzAEKpy4Lw7c=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-481-6MB5NHOoPI2bM8Wpimvo1Q-1; Fri,
 06 Mar 2026 08:42:31 -0500
X-MC-Unique: 6MB5NHOoPI2bM8Wpimvo1Q-1
X-Mimecast-MFC-AGG-ID: 6MB5NHOoPI2bM8Wpimvo1Q_1772804550
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1AB871956052;
	Fri,  6 Mar 2026 13:42:30 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.88.168])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 483091958DC7;
	Fri,  6 Mar 2026 13:42:27 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  Ilya Maximets <imaximet@redhat.com>,  Eelco Chaudron
 <echaudro@redhat.com>,  Stefano Brivio <sbrivio@redhat.com>,
  netdev@vger.kernel.org,  linux-kselftest@vger.kernel.org,
  linux-kernel@vger.kernel.org,  dev@openvswitch.org
Subject: Re: [PATCH net v3 2/6] selftests: net: make ovs-dpctl.py fail when
 pyroute2 is unsupported
In-Reply-To: <20260306000127.519064-3-aleksey.oladko@virtuozzo.com> (Aleksei
	Oladko's message of "Fri, 6 Mar 2026 00:01:23 +0000")
References: <20260306000127.519064-1-aleksey.oladko@virtuozzo.com>
	<20260306000127.519064-3-aleksey.oladko@virtuozzo.com>
Date: Fri, 06 Mar 2026 08:42:25 -0500
Message-ID: <f7tfr6dqdku.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Aleksei Oladko <aleksey.oladko@virtuozzo.com> writes:

> The pmtu.sh kselftest configures OVS using ovs-dpctl.py and falls back
> to ovs-vsctl only when ovs-dpctl.py fails. However, ovs-dpctl.py exits
> with a success status when the installed pyroute2 package version is
> lower than 0.6, even though the OVS datapath is not configured.
>
> As a result, pmtu.sh assumes that the setup was successful and
> continues running the test, which later fails due to the missing
> OVS configuration.
>
> Fix the exit code handling in ovs-dpctl.py so that pmtu.sh can detect
> that the setup did not complete successfully and fall back to
> ovs-vsctl.
>
> Fixes: 962e8a01eab9 ("selftests: openvswitch: Add version check for pyroute2")
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> ---

This change looks good to me.

Reviewed-by: Aaron Conole <aconole@redhat.com>

