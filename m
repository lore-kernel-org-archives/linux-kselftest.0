Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6BE192590;
	Sun,  1 Mar 2026 02:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772333141; cv=none; b=p1wghET2Iw4gm61FUkYkUFY+XH56RLLYzu/tp1kP/qYRFugZC6m1GGKrPg2GJNi0tqOcaxyKESFf03gMpz4H7h9TxgzN7clZ+Ci0qJFPBKcN5aKjzMbBkLq6GdigVhE9haNf6aP1ttk+FaD92voMCEcUYgRZ8YLYA8utat2ALHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772333141; c=relaxed/simple;
	bh=u+z3IvAvew/iveshBmqkFTXPa603uVev7bQy4YgDqH8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rkq/Llkp3MoszPdUDDH8KEGMclvoU3RV+NR8NG6Cu0fmz1NVu8MmF2yexjODN1LwGfew+bkwQ6FJk6c/N7rTr7ngVu23Jj8qeXJ6Z9b0KpdUteATSeRyeBv1WT2LtNBQBYIjWSboDV+XZIkuO06v42N3hmBKJATgUqJxvtkFdEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id DCD541401CC;
	Sun,  1 Mar 2026 02:36:56 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf01.hostedemail.com (Postfix) with ESMTPA id BD8D26000C;
	Sun,  1 Mar 2026 02:36:54 +0000 (UTC)
Message-ID: <8eb8c51eeb87f178e92e68bcfffd02701845c48d.camel@perches.com>
Subject: Re: [PATCH v2] get_maintainer: add KUnit maintainers for KUnit test
 files
From: Joe Perches <joe@perches.com>
To: Matteo Croce <technoboy85@gmail.com>, Brendan Higgins
	 <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 28 Feb 2026 18:36:53 -0800
In-Reply-To: <20260301011131.4057-1-teknoraver@meta.com>
References: <20260301011131.4057-1-teknoraver@meta.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: BD8D26000C
X-Stat-Signature: w1mdeebpx1oi3azkbaob9qmyqm4kj4jj
X-Rspamd-Server: rspamout03
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18N1/WjKwByiempuiFU1xukVby06JaJBLE=
X-HE-Tag: 1772332614-105552
X-HE-Meta: U2FsdGVkX18HAB523L7DFrvNQGRosF3MEOJp9kHvnBa70i6yZTDluXWRX81XTDmSoC+WdN268MempFVSn0z2RO8fbHmjGwKe5Nu/73X/LEq99uVUVt192GYI+dNVISEIpgknaUpjgpu1cVzMqRL7LRNAXwkMSBeIyVAxX+tyhSL6hAPvxALKVjCBJajNfeS+4KNgyHjHdMmWhvSxFSG8qUYhOCS7AGTT0DPqzoSE4rODcMo+C8kEooSFg2/4C6dY1qaMkGUkEdtHlUzPvD2ea+sH1m9ggimSXSxfM85x9oBeC49mW8ryLTgvWaZ+fiwjQMseoug0YVw8B+9NVp16a8IXXilc80c+

On Sun, 2026-03-01 at 02:11 +0100, Matteo Croce wrote:
> ```
> KUnit test files are scattered across the tree and don't always match
> the F: patterns in the KERNEL UNIT TESTING FRAMEWORK MAINTAINERS entry.
> Add the KUnit maintainers automatically when the file path matches
> common KUnit naming conventions: _kunit.c, -kunit.c, _kunit_test.c,
> and -kunit-tests.c.

nack.  There's no need to modify get_maintainer.

Use F: patterns instead.

diff --git a/MAINTAINERS b/MAINTAINERS
index 96e97d25e1c2..9796e184b9d5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13956,6 +13956,11 @@ F:     rust/kernel/kunit.rs
 F:	rust/macros/kunit.rs
 F:	scripts/rustdoc_test_*
 F:	tools/testing/kunit/
+F:	*/*[_-]kunit*.c
+F:	*/*/*[_-]kunit*.c
+F:	*/*/*/*[_-]kunit*.c
+F:	*/*/*/*/*[_-]kunit*.c
+F:	*/*/*/*/*/*[_-]kunit*.c
=20
 KERNEL USERMODE HELPER
 M:	Luis Chamberlain <mcgrof@kernel.org>
