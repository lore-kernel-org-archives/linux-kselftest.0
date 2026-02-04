Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF1E3B8D46
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Feb 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198721; cv=none; b=Yy02WJsXk2VeDBV1oWLif7KudRLNs5wOLYRM69noxHZCIwVUyjSbolA1YxsFr/RWcV6aOUl9Jiva0N7YnYaZGjVY/1uA4WUrI3/TVYR+o+D32PbTFaWMDpnOUgFLP4qBkuwe3UwApF1RiFNw5uZ1HAYkW1U8liHTdfcB0w7skEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198721; c=relaxed/simple;
	bh=8hDLDbF72dr7b/O4Zo0ApKCVlf3BYvSzKKhomnUdGFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGpiwWJvFsHO32h5QMKnQGjbC+TP8o1fSpKCBtuwN7UAXKcVbHag2dJ1QjIzqTQfiMdE78mX4E4ED2UvhFP6fV2GyQydGgYHkLazebp7BzpQnUBzlTPjYXF7asOK5FNJoA7RTzu5OAFVl+oI7YtGpol8U9XMNxx02Y8kUB+6P3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=TwAO/UPJ; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="TwAO/UPJ"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fed090e5fso344540f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Feb 2026 01:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770198718; x=1770803518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dGP603QDqaJG/dpPYsMG8GNhu8nGqxt3dyDV5ITQFhU=;
        b=TwAO/UPJHfH8/0kLBF6V9c6SiQn6pzA0ohafydvmLqYpFsNd0dNjbP5nnlpGo5RCGT
         TWXzypiVOeZ+1EHrx1CyH5XxjWsCKVs6WMQKRO0zQ4KVhpdUUZeFT07eezOYwrix6uXr
         141ZtOR84lWvNw4y8rbWcbL871IXHuRJD68UrKZPeFM8rv+PTEhr+2JwS0D541PcJRu0
         yeardM6mH9Uq15CVJ5VAho5ogy0mjNVnoSX3ux/fQV+quOAspFtMymX8pewOyk2jscTZ
         pZ0PeDCK5CnXS1JAazN49NGdcLCX7pSLpgnR9J24EPvR2RtHkmSmMxHL5QujC/Iaa7KF
         Qq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198718; x=1770803518;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGP603QDqaJG/dpPYsMG8GNhu8nGqxt3dyDV5ITQFhU=;
        b=O+oknm79NDkMx6fB0Xpdat85s8dGf5zTo1W57xB8yDh9b9KL6HM/3iLn1vlARhZ01r
         /rSOgw7j/AEWkHyujLfnCEUWjOzsH+f3eiyIbVcCrLUd/jIfYfyCuScz1XvwptJ0hN2/
         dLwOnRA0PLVszsh3gbIyneq65NmzSdZuA43nJs+fBGOLG18TS5RE14sDVpXttmG9Ndlg
         ry8xQYGZjkkjvP1hyexAgJ2+QUGQt9kTDaU1lHf5gTGjmwqLZSBCxaJNWymUPe5UMdT7
         zoBkxaF69hRjfYwNPtGd52dHU4mNyJ2KqwzSugHTiYNYAAsva8GTOPA6y3O5QAaobNPe
         C4uw==
X-Forwarded-Encrypted: i=1; AJvYcCUpipj2DyXZkPfPwo4DV9N/NbPMZvesDanzGzP9zSJMUrZg3+7iXxR9yL2+ZQXziAOdKN1XPtdgViESAxnyH64=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmPUHUGnktUhA5JXeK5ATFWyYWvMtlEZD4zpor3W0HUzOQHPUI
	sHd5+A2t/w10Zss4rB5fchu7u23KuiRTHJ9btleK52schz2TefCNrztlCQo/bzw6jCM=
X-Gm-Gg: AZuq6aIrnCU9lG6iJDGbZyY3avrqXC4Vx6gUY4scbE7ff98YRTPXDK6KHktqoQSHZ+g
	e/NbEnZOfsEZXVPeZ0Bsps8qVp1rbEQOHTm+cIhxJurTC58vpMFQjbB9j5gm+jm+jiS2FMwnxgb
	LBSLAG5n3hLxxAyzwfGS8d45XxKcNZr9Ws7/CuqwiLPmbnuvpt58cDAlrS/XhD57cqeFfyg9UVu
	eiBYOjXV1gRueZU7pdG4Fx1Oda19In3NOBMeVlyyDh0UOvSF7M69xfsudzf9jcm35ytbbJ3CYUf
	QAoJ0P4m+sTmE2vVGY/6HWdN2P+c9VPSa23+kUp5vaD4wb6ao/G89eoxi98Rx6RjkKLAUdHikak
	/5MG2bCQ4u6x4r/d6BN11kQIdw4RzhQbSM73W+qLpQKzer09ujyRd9PN9BTXbFBgsJCUMjJKgdN
	uttDU2TRRe6WRfR+VHtg4=
X-Received: by 2002:a05:6000:40d9:b0:435:a370:2d7a with SMTP id ffacd0b85a97d-43618053444mr3194322f8f.36.1770198717973;
        Wed, 04 Feb 2026 01:51:57 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805edcfsm5124440f8f.35.2026.02.04.01.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:51:57 -0800 (PST)
Date: Wed, 4 Feb 2026 10:51:55 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next 1/5] devlink: Add port-level resource
 infrastructure
Message-ID: <rye7fponvzxqbeexkreuxwvjlder34vfkofib4gwrhkbw3vres@udo2xxeek6xv>
References: <20260203071033.1709445-1-tariqt@nvidia.com>
 <20260203071033.1709445-2-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203071033.1709445-2-tariqt@nvidia.com>

Tue, Feb 03, 2026 at 08:10:29AM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>The current devlink resource infrastructure only supports device-level
>resources. Some hardware resources are associated with specific ports
>rather than the entire device, and today we have no way to show resource
>per-port.
>
>Add support for registering and querying resources at the port level,
>allowing drivers to expose per-port resource limits and usage.
>
>Example output:
>
>  $ devlink port resource show
>  pci/0000:03:00.0/196608:
>    name max_SFs size 20 unit entry
>  pci/0000:03:00.1/262144:
>    name max_SFs size 20 unit entry
>
>  $ devlink port resource show pci/0000:03:00.0/196608
>  pci/0000:03:00.0/196608:
>    name max_SFs size 20 unit entry
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>---
> Documentation/netlink/specs/devlink.yaml |  23 ++
> include/net/devlink.h                    |   8 +
> include/uapi/linux/devlink.h             |   2 +
> net/devlink/netlink.c                    |   2 +-
> net/devlink/netlink_gen.c                |  32 ++-
> net/devlink/netlink_gen.h                |   6 +-
> net/devlink/port.c                       |   3 +
> net/devlink/resource.c                   | 282 ++++++++++++++++++-----
> 8 files changed, 301 insertions(+), 57 deletions(-)

Way too big for a single patch. Could you split it in logical chunks
please?


>
>diff --git a/Documentation/netlink/specs/devlink.yaml b/Documentation/netlink/specs/devlink.yaml
>index 837112da6738..0290db1b8393 100644
>--- a/Documentation/netlink/specs/devlink.yaml
>+++ b/Documentation/netlink/specs/devlink.yaml
>@@ -2336,3 +2336,26 @@ operations:
>             - bus-name
>             - dev-name
>             - port-index
>+
>+    -
>+      name: port-resource-get

Why this is not aligned with DEVLINK_CMD_RESOURCE_* ?
$ git grep CMD_RESOURCE_ include/uapi/linux/devlink.h
include/uapi/linux/devlink.h:   DEVLINK_CMD_RESOURCE_SET,
include/uapi/linux/devlink.h:   DEVLINK_CMD_RESOURCE_DUMP,

I'm aware that DEVLINK_CMD_RESOURCE_DUMP only implements "do" now, but I
think both should be named the same, no?


>+      doc: Get port resources.
>+      attribute-set: devlink
>+      dont-validate: [strict]
>+      do:
>+        pre: devlink-nl-pre-doit-port
>+        post: devlink-nl-post-doit
>+        request:
>+          value: 85
>+          attributes: *port-id-attrs
>+        reply: &port-resource-get-reply
>+          value: 85
>+          attributes:
>+            - bus-name
>+            - dev-name
>+            - port-index
>+            - resource-list
>+      dump:
>+        request:
>+          attributes: *dev-id-attrs
>+        reply: *port-resource-get-reply

[...]


>-int devl_resource_register(struct devlink *devlink,
>-			   const char *resource_name,
>-			   u64 resource_size,
>-			   u64 resource_id,
>-			   u64 parent_resource_id,
>-			   const struct devlink_resource_size_params *size_params)
>+static int
>+devl_resource_reg_by_list(struct devlink *devlink,


can't this be "register"?

Also, why "by_list"? Sounds odd. Could you perhaps have it as
__devl_resource_register(). That's the usual pattern for similar
functions here, isn't it?

Also, could you do this "list" abstraction in a separate patch?



>+			  struct list_head *res_list_head,
>+			  const char *resource_name, u64 resource_size,
>+			  u64 resource_id, u64 parent_res_id,
>+			  const struct devlink_resource_size_params *params)
> {
> 	struct devlink_resource *resource;
> 	struct list_head *resource_list;
>@@ -341,9 +344,10 @@ int devl_resource_register(struct devlink *devlink,
> 
> 	lockdep_assert_held(&devlink->lock);
> 
>-	top_hierarchy = parent_resource_id == DEVLINK_RESOURCE_ID_PARENT_TOP;
>+	top_hierarchy = parent_res_id == DEVLINK_RESOURCE_ID_PARENT_TOP;
> 
>-	resource = devlink_resource_find(devlink, NULL, resource_id);
>+	resource = devlink_resource_find_by_list(res_list_head, NULL,
>+						 resource_id);
> 	if (resource)
> 		return -EEXIST;
> 
>@@ -352,15 +356,15 @@ int devl_resource_register(struct devlink *devlink,
> 		return -ENOMEM;
> 
> 	if (top_hierarchy) {
>-		resource_list = &devlink->resource_list;
>+		resource_list = res_list_head;
> 	} else {
>-		struct devlink_resource *parent_resource;
>+		struct devlink_resource *parent_res;
> 
>-		parent_resource = devlink_resource_find(devlink, NULL,
>-							parent_resource_id);
>-		if (parent_resource) {
>-			resource_list = &parent_resource->resource_list;
>-			resource->parent = parent_resource;
>+		parent_res = devlink_resource_find_by_list(res_list_head, NULL,
>+							   parent_res_id);
>+		if (parent_res) {
>+			resource_list = &parent_res->resource_list;
>+			resource->parent = parent_res;
> 		} else {
> 			kfree(resource);
> 			return -EINVAL;
>@@ -372,46 +376,78 @@ int devl_resource_register(struct devlink *devlink,
> 	resource->size_new = resource_size;
> 	resource->id = resource_id;
> 	resource->size_valid = true;
>-	memcpy(&resource->size_params, size_params,
>-	       sizeof(resource->size_params));
>+	memcpy(&resource->size_params, params, sizeof(resource->size_params));
> 	INIT_LIST_HEAD(&resource->resource_list);
> 	list_add_tail(&resource->list, resource_list);
> 
> 	return 0;
> }
>+
>+/**
>+ * devl_resource_register - devlink resource register
>+ *
>+ * @devlink: devlink
>+ * @resource_name: resource's name
>+ * @resource_size: resource's size
>+ * @resource_id: resource's id
>+ * @parent_resource_id: resource's parent id
>+ * @params: size parameters
>+ *
>+ * Generic resources should reuse the same names across drivers.
>+ * Please see the generic resources list at:
>+ * Documentation/networking/devlink/devlink-resource.rst
>+ *
>+ * Return: 0 on success, negative error code otherwise.
>+ */
>+int devl_resource_register(struct devlink *devlink, const char *resource_name,
>+			   u64 resource_size, u64 resource_id,
>+			   u64 parent_resource_id,
>+			   const struct devlink_resource_size_params *params)
>+{
>+	return devl_resource_reg_by_list(devlink, &devlink->resource_list,
>+					      resource_name, resource_size,
>+					      resource_id, parent_resource_id,
>+					      params);
>+}

[...]
