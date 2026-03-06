Received: from relay.virtuozzo.com (relay.virtuozzo.com [130.117.225.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6AA1F3BA4;
	Fri,  6 Mar 2026 00:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.117.225.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755307; cv=none; b=gLcp83zAaGSWOjsx/2mltZVV8QPgbxQYBcwzu/aPo2fLePTS8iiAGfpf2cnL2F8limiM4lUbTf6Q2R7TxgszpJj/t1uOSEUcTo8XOkZ3lH+IYPZY+rzNhyr1RKl6OJFhzlfAEebW4q6EHcZyDJzsIPhdlyAdYvICl7yfoQV+Tok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755307; c=relaxed/simple;
	bh=F5R/HzOo+2aYhyz7WWmZaiSz/+GLsAEzEoVVbmjeyDg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iAcfosE3tPFmOd8DcxHcjU3Z1n6hIdO446fCTGrH95W/iAuUKV1OQk8BoIsBR5x9h4FEqQqzvIFSRMY+OekyY7QaT9E7suJ/lWRDsE+pbVurKdKkijXkyL2slKcAtkB5nbUSjDCQxqZdrLT6UUnqxttcqmyrpSCErBmwkNEzJBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com; spf=pass smtp.mailfrom=virtuozzo.com; dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b=ckrkB93l; arc=none smtp.client-ip=130.117.225.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=virtuozzo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=virtuozzo.com header.i=@virtuozzo.com header.b="ckrkB93l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=virtuozzo.com; s=relay; h=MIME-Version:Message-ID:Date:Subject:From:
	Content-Type; bh=1Ng2JCLkEw+qHZebwe8cQikws2towcWTqyU4dFvUKMw=; b=ckrkB93lqeKR
	97mNnTLZFUgP+AMCA+X9WiIUT+vqRPa9vglRCN1kdmcS6GP58oZPlnepVt2gXdb/huLIvzFw4emfl
	wjIfu59zvuni67x4/GUsaaWnwoqPY7Z8enP9DHCxfGP+prKpY4YGP5EK+ud2zsI1A1eYK7wwihLuf
	LAfxmZGszNsgBG9kCPpGK4jfMKlVl6STPARx4T1+9COco67/pAnMYIK/pXUBpiTmVlf0woJ0zggcs
	5zMS9OBVvbxdveH955vd5FVkzY7bbG3yioC/9mhRQK6Ranbb3YfgIJYYK0hfSp5UDkZM6GBbdlyC4
	emowW0x2+p4r/8BsO8vs4g==;
Received: from [130.117.225.5] (helo=dev004.aci.vzint.dev)
	by relay.virtuozzo.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aleksey.oladko@virtuozzo.com>)
	id 1vyIbm-006Foq-1C;
	Fri, 06 Mar 2026 01:01:29 +0100
Received: from dev004.aci.vzint.dev (localhost [127.0.0.1])
	by dev004.aci.vzint.dev (8.16.1/8.16.1) with ESMTPS id 62601VXc519087
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 6 Mar 2026 00:01:31 GMT
Received: (from root@localhost)
	by dev004.aci.vzint.dev (8.16.1/8.16.1/Submit) id 62601TkU519086;
	Fri, 6 Mar 2026 00:01:29 GMT
From: Aleksei Oladko <aleksey.oladko@virtuozzo.com>
To: "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Aaron Conole <aconole@redhat.com>,
        Ilya Maximets <imaximet@redhat.com>,
        Eelco Chaudron <echaudro@redhat.com>,
        Stefano Brivio <sbrivio@redhat.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, dev@openvswitch.org,
        Aleksei Oladko <aleksey.oladko@virtuozzo.com>
Subject: [PATCH net v3 0/6] selftests: net: fix false failures due to missing features and host interference
Date: Fri,  6 Mar 2026 00:01:21 +0000
Message-ID: <20260306000127.519064-1-aleksey.oladko@virtuozzo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series addresses several issues in the networking kselftests
that cause false-positive failures depending on the host environment,
kernel configuration, or library versions.

The main focus of these changes is to isolate tests from the host
environment (using namespaces) and to ensure proper fallback or
skipping when dependencies are missing.

Summary of changes:
1. Adds a check for cls_basic module in fib_tests. Without this
   module, the test fails when attempting to add tc rules instead
   of skipping.
2. Fixes ovs-dpctl.py to return a non-zero exit code when pyroute2
   is too old. This allows pmtu.sh to correctly fall back to ovs-vsctl
   instead of assuming the configuration was successful.
3,4,5. Move reuseport test into dedicated network namespaces. This prevents
   failures caused by port conflicts with host processes or interference
   from host firewall rules.
6. Ensures io_uring is enabled via sysctl before running io_uring_zerocopy
   test, preventing failures on systems where kernel.io_uring_disabled
   is set.

Signed-off-by: Aleksei Oladko <aleksey.oladko@virtuozzo.com>

Changes in v2:
- Fixed a typo by adding the missing backslash in Makefile
- Added a Fixes: tag to the appropriate commit as requested
- Link to v1: https://lore.kernel.org/linux-kselftest/20260120230558.328423-1-aleksey.oladko@virtuozzo.com

Changes in v3:
- renamed pmtu.sh to pmtu-test.sh and used pmtu.sh as the name
  of the wrapper. 
- since the test now runs in a dedicated netns, updates the ovs
  test case to correctly move network interfaces into the target
  namespace.
- Link to v2: https://lore.kernel.org/linux-kselftest/f7t1pj9v8h7.fsf@redhat.com/T/#t

Aleksei Oladko (4):
  selftests: net: fib_tests: skip rp_filter test if cls_basic is
    unavailable
  selftests: net: make ovs-dpctl.py fail when pyroute2 is unsupported
  selftests: net: rename pmtu.sh to pmtu-test.sh
  selftests: net: io_uring_zerocopy: enable io_uring for the test

Konstantin Khorenko (2):
  selftests: net: run reuseport tests in netns to avoid port conflicts
  selftests: net: run pmtu.sh in netns to avoid host firewall
    interference

 tools/testing/selftests/net/Makefile          |   13 +-
 tools/testing/selftests/net/fib_tests.sh      |    2 +
 .../selftests/net/io_uring_zerocopy_tx.sh     |    9 +
 .../selftests/net/openvswitch/ovs-dpctl.py    |    2 +-
 tools/testing/selftests/net/pmtu-test.sh      | 2492 +++++++++++++++++
 tools/testing/selftests/net/pmtu.sh           | 2492 +----------------
 tools/testing/selftests/net/reuseport_bpf.sh  |    4 +
 .../selftests/net/reuseport_bpf_cpu.sh        |    4 +
 .../selftests/net/reuseport_bpf_numa.sh       |    4 +
 .../selftests/net/reuseport_dualstack.sh      |    4 +
 10 files changed, 2531 insertions(+), 2495 deletions(-)
 create mode 100755 tools/testing/selftests/net/pmtu-test.sh
 create mode 100755 tools/testing/selftests/net/reuseport_bpf.sh
 create mode 100755 tools/testing/selftests/net/reuseport_bpf_cpu.sh
 create mode 100755 tools/testing/selftests/net/reuseport_bpf_numa.sh
 create mode 100755 tools/testing/selftests/net/reuseport_dualstack.sh

-- 
2.43.0

