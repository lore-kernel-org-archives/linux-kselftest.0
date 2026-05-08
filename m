Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DA33FB7DB
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778275744; cv=none; b=VMPAwzmNUu2WWnGAqNbW6h5Nw9eoQIdxj+9D//QU8FNsWYAixXJiZGPgDVA6CvXRqeLc8teQJgCW4OdZ4j49JpHxK7fyARunqJVuCHPdME/Mn1i8yu5yNv2ZCxpkL/ed2TQirVFSKrnDYYePmoJIPOouEL2p83cRjghu4TYWP9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778275744; c=relaxed/simple;
	bh=lm4ZsFpNUgwpK3YnX3D6FcdAELUM2A+q69wdbtD9hng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnoz7nn0qb8CVU+1uygdchmYls0p2BRa3Z0HQy9aYNNQAquTAU5sGFhV+0PAMyfFzF+1oP7vO24DriO3vuFbA0p+3+8kKd5C10PVsS1YSn0g6KHW7m97JqPh598Bswc7729yS2kv7kDsrnEp3H0oIAlLSqHwW7eXhFknNvgFPnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB1NAApR; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB1NAApR"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8ec37d52c0dso341057785a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778275742; x=1778880542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/LAF18jiWTLJl8Jwx6HS2JQdllgi/a4OQyHfJwaQg84=;
        b=dB1NAApRVCzA/GJ3Zsj63KroNB3QF16jAEzm+2Y5Z4Jd6dJRojdXOImqLa5jsJ03kR
         oM/vSwYadVwGRFXbPLOt3JG+qV+ygFOV00YT6B5e4Fu20iTuJdcv+qvm9D7yn4TZQDzo
         3lsUguU7SvDpNkkDK6cKzT4c2pYtv9rVlqvRF6OZqJP7pbuNfdoMwpAq4czB6xxAHT8H
         917O/5/cvnid69CWTYlJ3+TNduUJxqIpCx1HHiigYYR7S3fEbAcwboEx8qCQ6cT0KwYY
         6k8wF0lJVBkEO+2gBk7UV/0ivXlmvaqhu3wlQhVuzHjXvPqeqhbkQN89BOg7fu3pW1kN
         bUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778275742; x=1778880542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LAF18jiWTLJl8Jwx6HS2JQdllgi/a4OQyHfJwaQg84=;
        b=WsoV8uhsJCUZKmmkFxvXTU0okkTZUZmPBXWBTRI7861PAcbJoKjIZbHNW1WRkts8fI
         eO5a8wNis8fyUCM2JfFVXEzLos+/ShbMR9sFFk4dJ0CW6VDD49xulK8V/2kLLFunB3yS
         wkGBs2RD4A2Nf2m1VL8cnNmjjpD46SRwmfRdMH/E9S1fOW1CisWFZCNCnUQNUGLa8BAQ
         9bqfAhASB8Qukg7BlBuKNNy2SmOU9NG17F5SusHxAl9iJsic8NZ/lJbP0Ke2QP6kwVed
         kBMePuFXIj/0vvXJTJGEaCMiWyQH8IoQnII9dpFdmNRqpKe5XudWY3e+kdCDXQhj0Flo
         SZkw==
X-Forwarded-Encrypted: i=1; AFNElJ/wS1+jervN09sglSXhe+NuCYDbn+SLAsOYQMzLknchb49gKTF/rAJ66BWOiCQNhHridTQf1jeUk3hGRJC9tq4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLH7VNJA1akyelsD21hshFmZpv1fJCq68OcecHGkbwZFfq+n1r
	VxNNlT99sgHRqFPaxA3E9EGnwXQt0D29L6eWL1Lpi6KDmEJp+eFcaW2N
X-Gm-Gg: AeBDiesLOvoNS61nv312E2EtzSVzmoGIzbL44YYb0uNbnZAfFuohp/hkuVuOLhSx+6c
	akme2C9bOyarwwboj6yRD61ypJrOSPAlFWsY9nrxanW4hIVZCFyXYNhWMUrTHk3AtYAUNGI+j4y
	jOqbTXRhvSorP0Fg0AH6cJelFZEnEMNGrbLUUeYDZzTu2JT5yfr8Je/x3dqwrVzy6SAG1RjpdTz
	+5j5Wmt8TSsGIqE0ucpXolsL4Qn3UOKUbUmDACI7nM6k8rsdrhQ7S3uLMiECdZTwJKUC6dIibt7
	pXu2qLr4RmLv+2ke4SM8IkklApcye+GHBEBBBzyXhAsfz0H7/VHa/s3pHeYXlbiKgMsdJLgONZT
	DTQM2LiOG3R96626yWCTvVK9ozWGlR+NmxVS+d3U/TX8RLt8MOI0NOeWjmBbt+C5cz5X9qjR94y
	Eggn0HcRtSO0f7rYT762Rz+BLAaJa2R3i6eC+rbnvkT5Z8HzFfPFF7l1fovAzw5lYSUMw=
X-Received: by 2002:a05:620a:40d0:b0:8dd:b4fc:d561 with SMTP id af79cd13be357-904d438db5dmr2198955585a.10.1778275741832;
        Fri, 08 May 2026 14:29:01 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:f800:1::])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd057acsm2596938185a.47.2026.05.08.14.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:29:01 -0700 (PDT)
Date: Fri, 8 May 2026 14:28:55 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com,
	Daniel Borkmann <daniel@iogearbox.net>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, dw@davidwei.uk, sdf.kernel@gmail.com,
	mohsin.bashr@gmail.com, willemb@google.com, jiang.kun2@zte.com.cn,
	xu.xin16@zte.com.cn, wang.yaxin@zte.com.cn, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>,
	Mina Almasry <almasrymina@google.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 3/8] net: devmem: support TX over
 NETMEM_TX_NO_DMA devices
Message-ID: <af5Vlwb5RctHym8D@devvm29614.prn0.facebook.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
 <20260507-tcp-dm-netkit-v3-3-52821445867c@meta.com>
 <20260508134717.4ef87ab6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508134717.4ef87ab6@kernel.org>

On Fri, May 08, 2026 at 01:47:17PM -0700, Jakub Kicinski wrote:
> On Thu, 07 May 2026 19:27:48 -0700 Bobby Eshleman wrote:
> > +	/* Virtual device (e.g. netkit) the user called bind-tx on. Must be
> > +	 * NETMEM_TX_NO_DMA.
> > +	 */
> > +	struct net_device *vdev;
> 
> AI keeps complaining that we don't hold a reference to this dev which 
> I think is fine, we're just comparing pointers. Could we maybe make this
> a void pointer and mention in the comment that we treat it as "best
> effort cookie" (better phrasing welcome).
> 
> Or we should wipe these vdev pointers when vdevs disappear, not sure
> how hard that'd be (or whether it's worth the extra state).

My guess is this would probably be the simplest way?

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 644c286b778f..e28fae14c687 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -533,3 +533,38 @@ static const struct memory_provider_ops dmabuf_devmem_ops = {
 	.nl_fill		= mp_dmabuf_devmem_nl_fill,
 	.uninstall		= mp_dmabuf_devmem_uninstall,
 };
+
+static int net_devmem_netdev_event(struct notifier_block *nb,
+				   unsigned long event, void *ptr)
+{
+	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
+	struct net_devmem_dmabuf_binding *binding;
+	unsigned long id;
+
+	if (event != NETDEV_UNREGISTER)
+		return NOTIFY_DONE;
+
+	xa_for_each(&net_devmem_dmabuf_bindings, id, binding) {
+		if (!net_devmem_dmabuf_binding_get(binding))
+			continue;
+		mutex_lock(&binding->lock);
+		if (READ_ONCE(binding->vdev) == dev) {
+			ASSERT_EXCLUSIVE_WRITER(binding->vdev);
+			WRITE_ONCE(binding->vdev, NULL);
+		}
+		mutex_unlock(&binding->lock);
+		net_devmem_dmabuf_binding_put(binding);
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block net_devmem_netdev_nb = {
+	.notifier_call = net_devmem_netdev_event,
+};
+
+static int __init net_devmem_init(void)
+{
+	return register_netdevice_notifier(&net_devmem_netdev_nb);
+}
+subsys_initcall(net_devmem_init);


I'm open to either approach. The void* + comment is good too, IMHO.  For
the notifier, I'd probably want to add a test too ensure sendmsg() kicks
back after the device is removed.

Best,
Bobby
