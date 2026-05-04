Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E963E1234
	for <linux-kselftest@vger.kernel.org>; Mon,  4 May 2026 15:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910289; cv=none; b=c79CV04kIB8ibWg4OKBfT1frF+PbVi2JwGBNByLlCtlQPhxruhWGqvgo26TtoTiSuE96Zar6+rDTCyAxAYuVQAhVkC0IkE5PihVrj2+ZAFkzGZNXcwr4NDlCI2WVorHB69S1/eGdJC5DQbyamlVVo9SdOlCGeMtvgok0ziyugSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910289; c=relaxed/simple;
	bh=tW9EumHW1pHvUG6IQmWyvfRITKPRFwNLOdOmAnLilcw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hvvd5KWuXjdS/Cm67rR+N3rTGxcGsr0geUIdXWMN5ES9UQRlsQGpNHnTZPwHRIcnPDw+3YaTyd4K9g1xQMZXLB7iLV1vcuOsKl9nvVWh9WC7pnUnXaOxl3BkflqtsGVpcVaE8kX2tyvfHdVdl2qnUQSeLqkwXlRJtGz+K9dngB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YsAWKIaY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YsAWKIaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777910286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JN8svIitjHi+0YtK7HQD4akt5dsvF1C3v1yPtgOpFGo=;
	b=YsAWKIaY0FVr5frymg9+yWKFk9u3j2Q+yAJehRjAuvH6CX6GVbHrckm4p60njY+vlw64dI
	xQ34qtNxr7hiCqAXNCR+TN51TxlB8pT+6QudSeKKWMMgOWeCnUhJR0qpiOmds/au7s/dXP
	EfZ86xx7wwQy/jBa3gQltr1C4hjU5e0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-313-X9GY2M_XMLqulU50FrL-Yw-1; Mon,
 04 May 2026 11:58:01 -0400
X-MC-Unique: X9GY2M_XMLqulU50FrL-Yw-1
X-Mimecast-MFC-AGG-ID: X9GY2M_XMLqulU50FrL-Yw_1777910279
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D29751956046;
	Mon,  4 May 2026 15:57:58 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.64.157])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 71B1530001A1;
	Mon,  4 May 2026 15:57:55 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Ilya Maximets <i.maximets@ovn.org>
Cc: netdev@vger.kernel.org,  Eelco Chaudron <echaudro@redhat.com>,  "David
 S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,
  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>,
  Simon Horman <horms@kernel.org>,  Shuah Khan <shuah@kernel.org>,  Yuan
 Tan <tanyuan98@outlook.com>,  Yang Yang <n05ec@lzu.edu.cn>,
  dev@openvswitch.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  stable@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] openvswitch: vport: fix self-deadlock on
 release of tunnel ports
In-Reply-To: <20260430233848.440994-2-i.maximets@ovn.org> (Ilya Maximets's
	message of "Fri, 1 May 2026 01:38:37 +0200")
References: <20260430233848.440994-1-i.maximets@ovn.org>
	<20260430233848.440994-2-i.maximets@ovn.org>
Date: Mon, 04 May 2026 11:57:54 -0400
Message-ID: <f7tcxzbxj3x.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Ilya Maximets <i.maximets@ovn.org> writes:

> vports are used concurrently and protected by RCU, so netdev_put()
> must happen after the RCU grace period.  So, either in an RCU call or
> after the synchronize_net().  The rtnl_delete_link() must happen under
> RTNL and so can't be executed in RCU context.  Calling synchronize_net()
> while holding RTNL is not a good idea for performance and system
> stability under load in general, so calling netdev_put() in RCU call
> is the right solution here.
>
> However,
> when the device is deleted, rtnl_unlock() will call netdev_run_todo()
> and block until all the references are gone.  In the current code this
> means that we never reach the call_rcu() and the vport is never freed
> and the reference is never released, causing a self-deadlock on device
> removal.
>
> Fix that by moving the rcu_call() before the rtnl_unlock(), so the
> scheduled RCU callback will be executed when synchronize_net() is
> called from the rtnl_unlock()->netdev_run_todo() while the RTNL itself
> is already released.
>
> Fixes: 6931d21f87bc ("openvswitch: defer tunnel netdev_put to RCU release")
> Cc: stable@vger.kernel.org
> Acked-by: Eelco Chaudron <echaudro@redhat.com>
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
> ---

Acked-by: Aaron Conole <aconole@redhat.com>

