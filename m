Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6306836D50E
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Jan 2026 21:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769117547; cv=none; b=up6S0DLp32m6bOsj5UgVa+tMhxl/XvSI/PAH9SIWmZ+PxhETLsT5lnXj5fKOqo7vhi/4tp5U/sM8c2eqsUiNw67NixjmIAc6k4zlGe4G3KdsKHePv24h0IPjWfsh7wJi5DnlaT18KNkagP9E2crPUGmkoHGi0/u7q/qr/06RjV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769117547; c=relaxed/simple;
	bh=v0P96Z0aRmf4q0S4zq2JgoGYTQnkEs7zQqmXU6ar3HE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hexaTjp1JeNz/cc7mKafAFli86j7bEPsOqK5NggZfjXaqZOKOYxjBCiXow960nlD5RY4xbcHLLSUClpXvT71wqpyQ8GwhdN6GZcX9Kn7I2wjtD1e1PIUDo1o2R7qgOIyZrinBFWgi7Ta82tcftD6A8GkDg0E7h6GAUVFgzR5kFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WWLd9mJg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WWLd9mJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769117538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oLjsVSVWp5TxJT1pf9TFdMJsBUtHxxrgfqSXsvcsR5I=;
	b=WWLd9mJgYySllN2W1flaH7qS5WEmeXGsW7RKlB7X5qR52UVKN6IwX+A9vHd2/zsMZyu52n
	VKtJe44jZ1TWyh/1KtdflPa3CLuIdc3RYFuOLhyIbLNFxcN3VYz59EjK0IV2jywf+N5CdO
	JxOgBiEnqLRz+c0tUc4kdq72OELsBPE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-408-qTfaNDFsOH6O-dzcd-SG5Q-1; Thu,
 22 Jan 2026 16:32:15 -0500
X-MC-Unique: qTfaNDFsOH6O-dzcd-SG5Q-1
X-Mimecast-MFC-AGG-ID: qTfaNDFsOH6O-dzcd-SG5Q_1769117534
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B63918005B7;
	Thu, 22 Jan 2026 21:32:14 +0000 (UTC)
Received: from RHTRH0061144 (unknown [10.22.64.171])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E18331956095;
	Thu, 22 Jan 2026 21:32:11 +0000 (UTC)
From: Aaron Conole <aconole@redhat.com>
To: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Cc: "David S . Miller" <davem@davemloft.net>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni
 <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Shuah Khan
 <shuah@kernel.org>,  netdev@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] selftests: net: make ovs-dpctl.py fail when
 pyroute2 is unsupported
In-Reply-To: <20260120230558.328423-3-aleksey.oladko@virtuozzo.com> (Aleksei
	Oladko's message of "Tue, 20 Jan 2026 23:05:55 +0000")
References: <20260120230558.328423-1-aleksey.oladko@virtuozzo.com>
	<20260120230558.328423-3-aleksey.oladko@virtuozzo.com>
Date: Thu, 22 Jan 2026 16:32:10 -0500
Message-ID: <f7tzf65uyed.fsf@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Aleksei,

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
> Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
> ---

You should also include the fixes line when you post another version:

92e37f20f20a ("selftests: openvswitch: Add version check for pyroute2")

>  tools/testing/selftests/net/openvswitch/ovs-dpctl.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> index b521e0dea506..848f61fdcee0 100644
> --- a/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> +++ b/tools/testing/selftests/net/openvswitch/ovs-dpctl.py
> @@ -2583,7 +2583,7 @@ def main(argv):
>      prverscheck = pyroute2.__version__.split(".")
>      if int(prverscheck[0]) == 0 and int(prverscheck[1]) < 6:
>          print("Need to upgrade the python pyroute2 package to >= 0.6.")
> -        sys.exit(0)
> +        sys.exit(1)
>  
>      parser = argparse.ArgumentParser()
>      parser.add_argument(

