Received: from sphereful.davidgow.net (sphereful.davidgow.net [203.29.242.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3686F372B57;
	Sat, 11 Jul 2026 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.242.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783756500; cv=none; b=M4v/QxJuH3bnOHm7AhA43oxzNq0DHzXi87GWMu71i0fpUpu6G5cT0/0KwUAsmDFrgXhbU5yieT7amVBKZxBXApExNywMkOfd8F+GwOLrUmRKlmY0P0gfD9ErLTpv/TgJupu1XkhsL7QcNvwLJhe56dmC9s3qeZJdb98WkwxfOHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783756500; c=relaxed/simple;
	bh=AVt5pKjQRYHCQxOiuhK3gxGkUjA/wr75dbeCZ6A0VwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/Ce4cP6+gHML69R9f3+ouwlSykuii9s3ofdCnBlmNNpyiT0pvbwyavCgX6DtfAOGNtAiFTcZpLqRaK9QQ+9ks6KnGF9ESdizYtjOP3r1sHNxhh1XxGsTHaaknjTrVTUzW5VRR5yWU72xkH9M/eDR9ZhW2Otr6pkqm0pnkjoq78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net; spf=pass smtp.mailfrom=davidgow.net; arc=none smtp.client-ip=203.29.242.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=davidgow.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidgow.net
Received: by sphereful.davidgow.net (Postfix, from userid 119)
	id 8A00A1EA71D; Sat, 11 Jul 2026 15:54:50 +0800 (AWST)
X-Spam-Level: 
Received: from [IPV6:2001:8003:8810:ea00::41b] (unknown [IPv6:2001:8003:8810:ea00::41b])
	by sphereful.davidgow.net (Postfix) with ESMTPSA id 936081EA6CA;
	Sat, 11 Jul 2026 15:54:46 +0800 (AWST)
Message-ID: <21eb8388-df9b-4c53-8de9-5ed103892fec@davidgow.net>
Date: Sat, 11 Jul 2026 15:54:43 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] kunit: provide a set of fwnode-oriented helpers
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Linus Walleij <linusw@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
 driver-core@lists.linux.dev, linux-gpio@vger.kernel.org
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
 <20260710-swnode-fw-devlink-v3-1-993f31874e40@oss.qualcomm.com>
Content-Language: en-US
From: David Gow <david@davidgow.net>
In-Reply-To: <20260710-swnode-fw-devlink-v3-1-993f31874e40@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 10/07/2026 à 21:51, Bartosz Golaszewski a écrit :
> Provide three new kunit-managed helpers for test cases that need to
> register/create dynamic software nodes.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Thanks: these look good to me. I'm assuming they'll head in with the 
rest of the series, rather than separately via the kselftest/kunit tree.

Reviewed-by: David Gow <david@davidgow.net>

Cheers,
-- David

>   include/kunit/fwnode.h |  26 +++++++++++
>   lib/kunit/Makefile     |   1 +
>   lib/kunit/fwnode.c     | 116 +++++++++++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 143 insertions(+)
> 
> diff --git a/include/kunit/fwnode.h b/include/kunit/fwnode.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..239bc71eb5072ccead0beb51fc0882bab69c6877
> --- /dev/null
> +++ b/include/kunit/fwnode.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * KUnit resource management helpers for firmware nodes.
> + *
> + * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
> + */
> +
> +#ifndef _KUNIT_FWNODE_H
> +#define _KUNIT_FWNODE_H
> +
> +struct kunit;
> +struct fwnode_handle;
> +struct property_entry;
> +struct software_node;
> +
> +struct fwnode_handle *
> +kunit_fwnode_create_software_node(struct kunit *test,
> +				  const struct property_entry *properties,
> +				  const struct fwnode_handle *parent);
> +struct fwnode_handle *
> +kunit_software_node_register(struct kunit *test,
> +			     const struct software_node *node);
> +int kunit_software_node_register_node_group(struct kunit *test,
> +					    const struct software_node *const *nodes);
> +
> +#endif /* _KUNIT_FWNODE_H */
> diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> index 2e8a6b71a2ab07a738964a7ef0f442fd53e085b1..204e02b10eba1030c6d511991fe2f6271de64603 100644
> --- a/lib/kunit/Makefile
> +++ b/lib/kunit/Makefile
> @@ -11,6 +11,7 @@ kunit-objs +=				test.o \
>   					attributes.o \
>   					device.o \
>   					platform.o \
> +					fwnode.o \
>   					bug.o
>   
>   ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
> diff --git a/lib/kunit/fwnode.c b/lib/kunit/fwnode.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..332490f07fae78e0fbf2930f9c80da0cc7dce028
> --- /dev/null
> +++ b/lib/kunit/fwnode.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
> + */
> +
> +#include <kunit/fwnode.h>
> +#include <kunit/test.h>
> +
> +#include <linux/fwnode.h>
> +#include <linux/property.h>
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(fwnode_remove_software_node_wrapper,
> +			    fwnode_remove_software_node,
> +			    struct fwnode_handle *);
> +
> +/**
> + * kunit_fwnode_create_software_node() - Create a kunit-managed software node
> + * @test: Test context
> + * @properties: Properties to use to create the new software node
> + * @parent: Parent of this software node
> + *
> + * Create a test-managed software node and return its firmware node handle.
> + * The software node is removed after the test case completes.
> + *
> + * Returns:
> + * Firmware node handle of the newly created software node or IS_ERR() on
> + * failure.
> + */
> +struct fwnode_handle *
> +kunit_fwnode_create_software_node(struct kunit *test,
> +				  const struct property_entry *properties,
> +				  const struct fwnode_handle *parent)
> +{
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	fwnode = fwnode_create_software_node(properties, parent);
> +	if (IS_ERR(fwnode))
> +		return fwnode;
> +
> +	ret = kunit_add_action_or_reset(test, fwnode_remove_software_node_wrapper,
> +					fwnode);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return fwnode;
> +}
> +EXPORT_SYMBOL_GPL(kunit_fwnode_create_software_node);
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_wrapper,
> +			    software_node_unregister,
> +			    const struct software_node *);
> +
> +/**
> + * kunit_software_node_register() - Register a kunit-managed software node
> + * @test: Test context
> + * @swnode: Software node to register
> + *
> + * Register a test-managed software node and return its firmware node handle.
> + * The software node is unregistered after the test case completes.
> + *
> + * Returns:
> + * Firmware node handle of the registered software node or IS_ERR() on failure.
> + */
> +struct fwnode_handle *
> +kunit_software_node_register(struct kunit *test,
> +			     const struct software_node *swnode)
> +{
> +	struct fwnode_handle *fwnode;
> +	int ret;
> +
> +	ret = software_node_register(swnode);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	fwnode = software_node_fwnode(swnode);
> +	if (WARN_ON(!fwnode))
> +		return ERR_PTR(-ENOENT);
> +
> +	ret = kunit_add_action_or_reset(test, software_node_unregister_wrapper,
> +					(void *)swnode);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return fwnode;
> +}
> +EXPORT_SYMBOL_GPL(kunit_software_node_register);
> +
> +KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_node_group_wrapper,
> +			    software_node_unregister_node_group,
> +			    const struct software_node *const *);
> +
> +/**
> + * kunit_software_node_register_node_group() - Register a kunit-managed software node group
> + * @test: Test context
> + * @nodes: Software node group to register
> + *
> + * Register a test-managed software node group. The nodes are unregistered
> + * after the test case completes.
> + *
> + * Returns:
> + * 0 on success, negative error number on failure.
> + */
> +int kunit_software_node_register_node_group(struct kunit *test,
> +					    const struct software_node *const *nodes)
> +{
> +	int ret;
> +
> +	ret = software_node_register_node_group(nodes);
> +	if (ret)
> +		return ret;
> +
> +	return kunit_add_action_or_reset(test, software_node_unregister_node_group_wrapper,
> +					 (void *)nodes);
> +}
> +EXPORT_SYMBOL_GPL(kunit_software_node_register_node_group);
> 

