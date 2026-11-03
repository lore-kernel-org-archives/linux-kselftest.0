Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793681339;
	b=O2Hgf8juBXrbi70OHJNqrsXxDh130ICzYFN84nCFdHR5DApsfywMceoFgbMxXFHUTgO7
	 2mlC0a+xs7C0tYFHvn5To2KRGBR8HnQEkYdzy48HYNOY7QbBQuClc1H/swJyo6rvKn+X0
	 ++a7AU5tpIsfDYTXMuVQ+mKi6gJrnlwdCyHK000vecydflHRJJYSDH0a/925zeS1TQ1br
	 E0hyPF2wQa4ziGUSoIOtuqID3+kaR5yYcpLKWyP1hKtxbDaorc2lkLrpPBl0DKQiIU2Zz
	 zrOD83MqVODdDpt2kF3WRhuoN+VNp05rDi3DJnt5pJdhqdjTHyWGbabyPl8Ic9eXmuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793681339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zCHD1aIKZc3dFq2/pqI8Cbn/B96ityC0q1gr//qHJbs=;
	b=aknVPAMMIH62IE7ABoJ4pEDjE3qUGNJvxDk/79zUPRW0yAKveHF9YYu56xJDTxk2cctG
	 4aUGxOg8PWKcCaDB/DTW8TO+UGtxNOYxQxFE1zBcxsJTSBTAmOU19HvonE46gTxvszymJ
	 YyN0cgBhWEf4vg1zq/Fr4jkooQ2lz80IiFDTMfZT59pJjPOWdrDIiKy9PYdTMwf30Rmdb
	 VJLkco6sBXrtwNEZaRah5ZHyJ/MSoG6gwiLhUg1obzT00m/TgcXngcS6PkU2g/5w/Mx4o
	 WNLtcmxbfLwjp5ww+eJXg71X494nX5DP8ZzmPbuWUEMHrdXUeVgsN4a5SLKuTcjvNcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SwmlpZDa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TfhKBhnn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D16B606A334
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 04:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D16B606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SwmlpZDa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TfhKBhnn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31vqa21120773
	for <linux-kselftest@vger.kernel.org>; Tue, 3 Nov 2026 04:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zCHD1aIKZc3
	dFq2/pqI8Cbn/B96ityC0q1gr//qHJbs=; b=SwmlpZDapvnxrPqjXW1Zgw4G6OI
	SctU7p5FsJA6wW9BK2Bbbxeze29Y+GxwPaxZ6BIRMS0v5TUPc2crOczu7Qq86tfP
	z2AOYIxQCQh8pfDd4aPS0tjk6WrXqRHwdixvt2dXV1BGD2MdFdrb96IlZ/V2H9sP
	l+5cSndyoRuUZns7y9FnJkzpWBBXEKxTFBVyPyTXz/HzN6AnN5iI6kzmrK8ciqZX
	fiAu4nQbM2LxT7bg3/Yi7kZ0bmD06w2LqwaZO2uT2NNOZdTCxwfBlJ66I8nsa3Q9
	OnNb3OWD2NsgCADmRCsDdyi5/oZxNQyl4MYzUSWlpRbMfQ8MscyG2WcMhvg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r1xy2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 04:48:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf7856ffso756591285a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 20:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793681337; x=1794286137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCHD1aIKZc3dFq2/pqI8Cbn/B96ityC0q1gr//qHJbs=;
        b=TfhKBhnnmKgz3+RcPewWNoAmMnFdbSsNGQuVpMDn4RcabcW3KAHViJJUZCXtALIJCN
         7zFS65teElu0j6A3Swvx/2H/T1fhItHSCPteBrzdRKIvp7ifSv3W36LrDybRkO2G9VZr
         mlXvMbzQXeH5U5xCzzfTXjeZzD3ecQ+uNHGSqw8lCq9FIy2jgAMaMvcCUmI6bqHGOFPA
         DAQ+nMM2H0njXjFWmIdS/41xzJDhia9RqxUB8ReSC4R6bdGfVDW5l3yMhdHc/oY5lbre
         X3zyR6/4nIu7jMcIy/qFuPg8C7/hapZ/4y8GFjcnj/p7X+jL/WX4RAJyZCgedHfEPj8Q
         /MEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793681337; x=1794286137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCHD1aIKZc3dFq2/pqI8Cbn/B96ityC0q1gr//qHJbs=;
        b=ZKU/lnuwbMc4hI1fdZpa91bhFNnnWK2W/TlJDFOD5XY/mIxrf2fB9g6LXlocszbcd+
         WUFf14ppBmWFKsRBqQDFUGC7DIpioi4BSDiH6EeNmUDle+vv26NOXsS0/64ZJ8EY9NGY
         oOTmzj3GJciNWvZ/Gi95VNzxgJVRTgl7axZM41WxaKKuWsrv0FUgLAAzujEgjbY1JRv7
         44k5yXbi+bI+2292Y7xFKvcf1zhgPeHg4ASrss109TuJ4uIkAnluir5FhGJ78Zj4yk07
         wtgUpHZxfNfGvROkj3PLg+klCAVBly8in8E6XPIJfXgwExb51rlCipIFMLETRzf2ZOyT
         Dh/g==
X-Forwarded-Encrypted: i=1; AKwUvBzdhLiSBwkxNdT1uswb1KdasVjjhtz1lFxxgjg9hsCTZFSLx11HpWvZoO6X5vBfPiJixwrXOHejTvSQinwVC50=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BbJmylgyN1L5KXyJIjZiB9d9zZ690mFn79mRv5Zt1KMcFy22h
	sPbvZIUIwYUCqR+PAqIr6orPDOCtbXpYiBiSptuo/pBb3KNdXcIg9LvDtU4VUVE/SfqGe2F18C4
	nMW993l024felOIZRLr8f6SLtFzwVQGkv9Mf+/qt+IdAadqDkYoroJqkgrgbS9levJ6HKFMU=
X-Gm-Gg: AYBFou2lllCow9VEUuB4ZwJK04lGX//zZjTgRoyv16TbdegoQyZF3rERDBEaOdbV6ad
	SSHW4S5szv8JtpcFTCuY4mGkRqKy6SG2jOFDo+/V5vy6PRLpBZJHUUaKYvB3QqhudS5VFsQS7i4
	Iti1ooqVT7QIUpdHldaOEiyLcGnzELy9wgHq2VHoxwh8FiAaVpxak+RqyThQACuy+K+Fswo+5sK
	1tjno4ogjAHmjJPcUMW7m45ByDoTFIKYAw84rY6TnPOD1ywSPgMLdnJiiuFb3moKpmMyv4RKtlr
	4M5SAvqihmM9ONLravyAveSOk7q0m5w2FIklahZDpyBs61bv7Ick3t4qF6LmBtCSduNpP7XE7dI
	AOsHCDw+WEeRJfzIuYZU0FPm7WhzCsIScNwbkAv8GjZlrQBZ93r9Zij/vFkPSfyWfjGbDk1g1vs
	b1
X-Received: by 2002:a05:620a:45ac:b0:93e:c12c:f121 with SMTP id af79cd13be357-944218577eemr2009963885a.77.1793681336453;
        Mon, 02 Nov 2026 20:48:56 -0800 (PST)
X-Received: by 2002:a05:620a:45ac:b0:93e:c12c:f121 with SMTP id af79cd13be357-944218577eemr2009962285a.77.1793681335845;
        Mon, 02 Nov 2026 20:48:55 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a879fb29sm25685445e9.4.2026.11.02.20.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:48:55 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 1/6] powercap: Add generic zone hierarchy creation helpers
Date: Tue,  3 Nov 2026 05:48:15 +0100
Message-ID: <d33ddfe789ee42a00d3ff3df55e0c4011e69debc.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793666444.git.daniel.lezcano@oss.qualcomm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mGLnAgZ3oUGxgFqVYwxwS5ditKShA-d6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX8tzU5sxnRtmc
 WI02uaRS9l6LfOTyl4ibxf30x4fAPpiUH9GRSvo1QJNqbz3m0qovhYftUpuU/ZvAgjMozVLh1YU
 PInI/X/tPiSdk5MzqKt6y+4/eX0DOc7N0iQjXZwBj+E+RhBs0T1KB8NLPyevbin4/NJShxXG6eZ
 miy/hEdTBFPbuo8cbB1nKVUImP5Pwu7FDH+pcYs6N1kcTZCB6xKnYj1BReN5WHNxis3jN2rGi3R
 5m97Mlq+JZTbsImbaT2BiiWpsIi2poNh4xbx246oDrm5KoUK+fxUbHizTzOXzTCzOByVQl9wna7
 FPvKTMVuA1n6aEH0GTxi+sgs7eYMZgezp44f5j9b1nqyfLtD/xLUYB3EfBAvQ68mCzpHLp7DAHS
 Z50nV0oNb8KBYHDghrx3xzRZQOODlq9hv+R4IfQK6s5tmp8MUlMPkrAxUNami4mHeLq/t/oEysN
 mp8/915NnR5ojGVVKSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxOCBTYWx0ZWRfX+Gmk+NV9eSF3
 134nFPHlWbN9uZIeyLinCuKOhsY8t22hv5QgaIJZOjgpz90Gh7DbXAzDIuyvsNyEXs1jA2gXH4k
 WMzsleT43OrzzXA+8NJ/fVBOvq15A88=
X-Proofpoint-GUID: mGLnAgZ3oUGxgFqVYwxwS5ditKShA-d6
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae967b9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=ePbI5pmQYSbfls1t7MoA:9 a=IoWCM6iH3mJn3m4BftBB:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030018

Powercap controllers may need to create several powercap zones organized
as a hierarchy. At present, each controller has to open-code the
hierarchy traversal, parent lookup, error rollback and reverse-order
destruction.

Introduce struct powercap_hierarchy to describe a powercap
hierarchy. Each node contains its name, parent, backend-specific data
and the powercap zone created for it.

For example, the following description:

  static struct powercap_node nodes[] = {
          { .name = "package" },
          { .name = "cpu", .parent = &nodes[0] },
          { .name = "gpu", .parent = &nodes[0] },
  };

  static struct powercap_hierarchy hierarchy =
          POWERCAP_HIERARCHY_INIT(hierarchy, nodes, ARRAY_SIZE(nodes));

creates the following hierarchy:

  package
  |-- cpu
  `-- gpu

Drivers supporting multiple platforms may provide a separate static
hierarchy description for each platform. These descriptions and their
node arrays can reside in initdata: only the hierarchy selected for the
running platform needs to remain available after initialization.

Add powercap_hierarchy_dup() to turn the selected description into a
working runtime hierarchy. Copy its node array and rebase parent pointers
to the copy, allowing all original descriptions, including the unselected
ones, to be reclaimed automatically with init memory. The names and
backend-private data are not duplicated and must remain valid for the
lifetime of the working hierarchy.

Add powercap_hierarchy_create() to walk the description in order. The
hierarchy describes the topology, but only the controller knows how to
initialize a zone for its underlying hardware and which powercap
operations and constraints to register.

The controller therefore supplies a function of type powercap_node_create_t
as the third argument to powercap_hierarchy_create().
For each node, the helper calls this function with the control type, node
name, node-private data and the already-created parent zone, or NULL for
a root. The function uses these arguments to initialize its backend state
and call powercap_register_zone(), then returns the registered zone.

The controller also supplies a powercap_node_destroy_t function as the
fourth argument. The helper calls it to unregister zones during rollback
or destruction, passing the control type, zone and node-private data.
These functions adapt the generic traversal to controller-specific zone
creation and cleanup; they are separate from the powercap zone operations
used for subsequent power readings and limit updates.

The creation function may let powercap allocate the zone or embed it in a
backend-specific structure to retrieve private data later using
container_of(). For example, an embedded zone can be allocated and
registered inside this function as follows:

  struct foo_powercap_zone {
          struct powercap_zone zone;
          struct foo_domain *domain;
  };

  foo_zone = kzalloc(sizeof(*foo_zone), GFP_KERNEL);
  if (!foo_zone)
          return ERR_PTR(-ENOMEM);

  foo_zone->domain = domain;

  pcz = powercap_register_zone(&foo_zone->zone, pct, name, parent,
                               &foo_zone_ops, nr_constraints,
                               &foo_constraint_ops);

For an embedded zone, its allocation, private state and lifetime remain
under the control of the backend.

The creation callback returns the registered powercap_zone pointer. The
hierarchy helper stores this pointer to provide it as the parent of
subsequent nodes and to pass it back during hierarchy destruction.

Validate node names and require every parent to be an earlier entry in
the same array before creating zones. Reject an already populated
hierarchy with -EBUSY without modifying its existing zones. Provide
POWERCAP_HIERARCHY_INIT() for static instances used directly by the
creation and destruction helpers; duplication initializes its own lock.

A callback may return NULL to skip a node and its descendants while
continuing independent branches. Error pointers abort creation and
trigger rollback.

Add powercap_hierarchy_destroy() to destroy the hierarchy in
reverse order, ensuring that children are removed before their parents.
Use the same mechanism to roll back previously created zones when the
creation of a subsequent node fails.

Serialize creation and destruction of each hierarchy to prevent
concurrent updates of the powercap zone pointers stored in its runtime
copy.

This provides a common mechanism for creating controller-defined
powercap hierarchies while keeping controller-specific operations
outside the powercap core.

Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Link: https://patch.msgid.link/20260806110159.69690-2-daniel.lezcano@oss.qualcomm.com
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
Changes in v5 (since v4):
- Add Reviewed-by from Lukasz Luba; no code changes.

Changes in v4 (since v3):
- Rebase on v7.3; no code or commit-description changes.

Changes in v3 (since v2):
- Rebase on v7.3-rc7.
- Add a static initializer and clarify hierarchy ownership and locking.
- Check for existing zones and validate names and parent ordering before
  creation; use zone for the runtime pointer member.
- Allow NULL callback results to skip branches; keep errors fatal.
- Use explicit locking and a signed reverse-loop index.
- Explain the controller callbacks, their arguments and their relationship
  to zone operations; update the description.

 drivers/powercap/powercap_sys.c | 204 +++++++++++++++++++++++++++++++
 include/linux/powercap.h        | 205 ++++++++++++++++++++++++++++++++
 2 files changed, 409 insertions(+)

diff --git a/drivers/powercap/powercap_sys.c b/drivers/powercap/powercap_sys.c
index 9197fa20d93f..a637929eefe3 100644
--- a/drivers/powercap/powercap_sys.c
+++ b/drivers/powercap/powercap_sys.c
@@ -667,6 +667,210 @@ int powercap_unregister_control_type(struct powercap_control_type *control_type)
 }
 EXPORT_SYMBOL_GPL(powercap_unregister_control_type);
 
+struct powercap_hierarchy *
+powercap_hierarchy_dup(const struct powercap_hierarchy *hierarchy)
+{
+	struct powercap_hierarchy *copy;
+	size_t i;
+
+	if (!hierarchy || !hierarchy->nodes || !hierarchy->nr_nodes)
+		return ERR_PTR(-EINVAL);
+
+	copy = kzalloc_obj(*copy);
+	if (!copy)
+		return ERR_PTR(-ENOMEM);
+
+	/*
+	 * The source node array may live in init memory. A shallow copy would
+	 * leave parent pointers referencing that array after it has been freed.
+	 * Copy the nodes now and rebase their parent pointers below. The name
+	 * and data objects remain owned by the backend and are not duplicated.
+	 */
+	copy->nodes = kmemdup_array(hierarchy->nodes, hierarchy->nr_nodes,
+				    sizeof(*copy->nodes), GFP_KERNEL);
+	if (!copy->nodes) {
+		kfree(copy);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	copy->nr_nodes = hierarchy->nr_nodes;
+	mutex_init(&copy->lock);
+
+	for (i = 0; i < copy->nr_nodes; i++) {
+		const struct powercap_node *parent = hierarchy->nodes[i].parent;
+		ptrdiff_t index;
+
+		copy->nodes[i].zone = NULL;
+
+		if (!copy->nodes[i].name)
+			goto invalid;
+
+		if (!parent)
+			continue;
+
+		index = parent - hierarchy->nodes;
+		if (index < 0 || index >= i)
+			goto invalid;
+
+		copy->nodes[i].parent = &copy->nodes[index];
+	}
+
+	return copy;
+
+invalid:
+	mutex_destroy(&copy->lock);
+	kfree(copy->nodes);
+	kfree(copy);
+
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL_GPL(powercap_hierarchy_dup);
+
+void powercap_hierarchy_free(struct powercap_hierarchy *hierarchy)
+{
+	if (!hierarchy)
+		return;
+
+	mutex_destroy(&hierarchy->lock);
+	kfree(hierarchy->nodes);
+	kfree(hierarchy);
+}
+EXPORT_SYMBOL_GPL(powercap_hierarchy_free);
+
+static void __powercap_hierarchy_destroy(struct powercap_control_type *pct,
+					 struct powercap_hierarchy *hierarchy,
+					 powercap_node_destroy_t powercap_node_destroy)
+{
+	ssize_t i = (typeof(i))hierarchy->nr_nodes - 1;
+
+	/* Creation validates that parents precede their children. */
+	for (; i >= 0; i--) {
+		if (!hierarchy->nodes[i].zone)
+			continue;
+
+		powercap_node_destroy(pct, hierarchy->nodes[i].zone,
+				      hierarchy->nodes[i].data);
+
+		hierarchy->nodes[i].zone = NULL;
+	}
+}
+
+int powercap_hierarchy_destroy(struct powercap_control_type *pct,
+			       struct powercap_hierarchy *hierarchy,
+			       powercap_node_destroy_t powercap_node_destroy)
+{
+	if (!pct || !hierarchy || !hierarchy->nodes ||
+	    !hierarchy->nr_nodes || !powercap_node_destroy)
+		return -EINVAL;
+
+	mutex_lock(&hierarchy->lock);
+
+	__powercap_hierarchy_destroy(pct, hierarchy, powercap_node_destroy);
+
+	mutex_unlock(&hierarchy->lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(powercap_hierarchy_destroy);
+
+/*
+ * Validate the hierarchy description before creating any zones. The caller
+ * must supply a non-empty node array and hold the hierarchy mutex.
+ *
+ * Every node must have a non-NULL name. A NULL parent identifies a root;
+ * otherwise, the parent must be an earlier entry in the same array. This
+ * excludes self-parenting, cycles and references outside the array, ensures
+ * parents are processed before children, and makes reverse-order destruction
+ * safe. Multiple roots are allowed; sibling ordering and unique names are not
+ * required.
+ *
+ * Return 0 for a valid description, or -EINVAL if any node violates these
+ * requirements. Runtime zone state is checked separately by the caller.
+ */
+static int powercap_hierarchy_validate(const struct powercap_hierarchy *hierarchy)
+{
+	size_t i;
+
+	for (i = 0; i < hierarchy->nr_nodes; i++) {
+		const struct powercap_node *parent = hierarchy->nodes[i].parent;
+		size_t j;
+
+		if (!hierarchy->nodes[i].name)
+			return -EINVAL;
+
+		if (!parent)
+			continue;
+
+		for (j = 0; j < i; j++) {
+			if (parent == &hierarchy->nodes[j])
+				break;
+		}
+
+		if (j == i)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+int powercap_hierarchy_create(struct powercap_control_type *pct,
+			      struct powercap_hierarchy *hierarchy,
+			      powercap_node_create_t powercap_node_create,
+			      powercap_node_destroy_t powercap_node_destroy)
+{
+	struct powercap_zone *pcz;
+	int ret;
+	size_t i;
+
+	if (!pct || !hierarchy || !hierarchy->nodes || !hierarchy->nr_nodes ||
+	    !powercap_node_create || !powercap_node_destroy)
+		return -EINVAL;
+
+	mutex_lock(&hierarchy->lock);
+
+	for (i = 0; i < hierarchy->nr_nodes; i++) {
+		if (hierarchy->nodes[i].zone) {
+			ret = -EBUSY;
+			goto out_unlock;
+		}
+	}
+
+	ret = powercap_hierarchy_validate(hierarchy);
+	if (ret)
+		goto out_unlock;
+
+	for (i = 0; i < hierarchy->nr_nodes; i++) {
+		struct powercap_zone *parent = NULL;
+
+		if (hierarchy->nodes[i].parent) {
+			parent = hierarchy->nodes[i].parent->zone;
+			if (!parent)
+				continue;
+		}
+
+		pcz = powercap_node_create(pct, hierarchy->nodes[i].name,
+					   hierarchy->nodes[i].data, parent);
+		if (IS_ERR(pcz)) {
+			ret = PTR_ERR(pcz);
+			goto rollback;
+		}
+
+		hierarchy->nodes[i].zone = pcz;
+	}
+
+	ret = 0;
+	goto out_unlock;
+
+rollback:
+	__powercap_hierarchy_destroy(pct, hierarchy, powercap_node_destroy);
+
+out_unlock:
+	mutex_unlock(&hierarchy->lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(powercap_hierarchy_create);
+
 static int __init powercap_init(void)
 {
 	int result;
diff --git a/include/linux/powercap.h b/include/linux/powercap.h
index 603419db924c..1115108dcf5b 100644
--- a/include/linux/powercap.h
+++ b/include/linux/powercap.h
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/idr.h>
+#include <linux/mutex.h>
 
 /*
  * A power cap class device can contain multiple powercap control_types.
@@ -309,4 +310,208 @@ struct powercap_zone *powercap_register_zone(
 int powercap_unregister_zone(struct powercap_control_type *control_type,
 				struct powercap_zone *power_zone);
 
+/**
+ * struct powercap_node - Description of a node in a powercap hierarchy
+ * @name: Name of the powercap zone.
+ * @parent: Parent node, or NULL if the node is a hierarchy root.
+ * @zone: Powercap zone created for this node. This field is managed by the
+ *	 hierarchy creation and destruction helpers.
+ * @data: Private data passed unchanged to the creation and destruction
+ *	  callbacks.
+ *
+ * This structure describes one node of a powercap hierarchy. The backend
+ * supplies an array of nodes through &struct powercap_hierarchy.
+ *
+ * Nodes must be ordered so that a parent appears before all its children.
+ * Duplication and creation validate this ordering. Reverse array order then
+ * guarantees that destruction removes children before their parents.
+ *
+ * The @name and @data objects must remain valid until the duplicated hierarchy
+ * has been freed. The @parent pointer is rebased by powercap_hierarchy_dup(),
+ * allowing the original node array to be released after duplication.
+ *
+ * The @zone field is runtime state managed by powercap_hierarchy_create() and
+ * powercap_hierarchy_destroy(). It is cleared when a node is destroyed.
+ */
+struct powercap_node {
+	const char *name;
+	struct powercap_node *parent;
+	struct powercap_zone *zone;
+	void *data;
+};
+
+/**
+ * struct powercap_hierarchy - Powercap zone hierarchy
+ * @nodes: Array describing the hierarchy nodes.
+ * @nr_nodes: Number of entries in @nodes.
+ * @lock: Lock serializing hierarchy creation and destruction.
+ *
+ * A backend may place the initial description in init memory and duplicate it
+ * with powercap_hierarchy_dup() before the init sections are released. The
+ * duplicated hierarchy owns the @nodes array, but not the objects referenced
+ * by &struct powercap_node.name and &struct powercap_node.data.
+ *
+ * A hierarchy passed directly to powercap_hierarchy_create() or
+ * powercap_hierarchy_destroy() must have an initialized lock. Use
+ * POWERCAP_HIERARCHY_INIT() for a static instance. A description used only as
+ * input to powercap_hierarchy_dup() does not need an initialized lock.
+ */
+struct powercap_hierarchy {
+	struct powercap_node *nodes;
+	size_t nr_nodes;
+	struct mutex lock;
+};
+
+/**
+ * POWERCAP_HIERARCHY_INIT - Initialize a static powercap hierarchy
+ * @name: Name of the hierarchy variable.
+ * @node_array: Array describing the hierarchy nodes.
+ * @count: Number of entries in the node array.
+ *
+ * The hierarchy and its node array must remain valid until destruction has
+ * completed. Only duplicated hierarchies may be passed to
+ * powercap_hierarchy_free().
+ */
+#define POWERCAP_HIERARCHY_INIT(name, node_array, count) { \
+	.nodes = (node_array), \
+	.nr_nodes = (count), \
+	.lock = __MUTEX_INITIALIZER(name.lock), \
+}
+
+/**
+ * powercap_hierarchy_dup - Duplicate a powercap hierarchy description
+ * @hierarchy: Hierarchy description to duplicate.
+ *
+ * Allocate a runtime hierarchy and copy the nodes from @hierarchy. Parent
+ * pointers are rebased to the duplicated node array and the runtime zone fields
+ * are initialized to NULL.
+ *
+ * Every parent must belong to the source node array and precede its children.
+ * The node names and private data are not duplicated and must remain valid
+ * until powercap_hierarchy_free() is called.
+ *
+ * Context: Process context. May sleep.
+ *
+ * Return: A pointer to the duplicated hierarchy on success, or an ERR_PTR()
+ * encoded error otherwise.
+ */
+struct powercap_hierarchy *powercap_hierarchy_dup(const struct powercap_hierarchy *hierarchy);
+
+/**
+ * powercap_hierarchy_free - Free a duplicated powercap hierarchy
+ * @hierarchy: Hierarchy to free, or NULL.
+ *
+ * Free the node array and hierarchy allocated by powercap_hierarchy_dup(). All
+ * registered zones must have been destroyed before calling this function.
+ */
+void powercap_hierarchy_free(struct powercap_hierarchy *hierarchy);
+
+/**
+ * typedef powercap_node_create_t - Create a powercap hierarchy node
+ * @pct: Powercap control type owning the hierarchy.
+ * @name: Name of the powercap zone to create.
+ * @data: Private data associated with the hierarchy node.
+ * @parent: Parent powercap zone, or NULL for a root node.
+ *
+ * Callback invoked by powercap_hierarchy_create() for each node in the
+ * hierarchy. The callback must create and register a powercap zone below
+ * @parent. The backend is expected to embed struct powercap_zone in its own
+ * object, pass the address of that member to powercap_register_zone(), and
+ * return the same address from this callback. This lets the backend recover
+ * its object with container_of() from subsequent powercap callbacks.
+ *
+ * Context: Called with the powercap hierarchy mutex held. The callback may
+ * sleep, but must not call powercap_hierarchy_create() or
+ * powercap_hierarchy_destroy() for the same hierarchy.
+ *
+ * Return: A valid pointer to the created powercap zone on success, NULL to
+ * skip this node and its descendants, or an ERR_PTR() encoded error to abort
+ * creation and roll back all zones created by this invocation.
+ */
+typedef struct powercap_zone *(*powercap_node_create_t)(struct powercap_control_type *pct,
+							const char *name, void *data,
+							struct powercap_zone *parent);
+/**
+ * typedef powercap_node_destroy_t - Destroy a powercap hierarchy node
+ * @pct: Powercap control type owning the hierarchy.
+ * @zone: Powercap zone to destroy.
+ * @data: Private data associated with the hierarchy node.
+ *
+ * Callback invoked when a hierarchy is destroyed or when its creation must
+ * be rolled back. The callback must unregister the powercap zone represented
+ * by @zone. The backend remains responsible for the lifetime of the enclosing
+ * object, including releasing it from the powercap zone release callback when
+ * necessary.
+ *
+ * Nodes are passed to this callback in reverse creation order, ensuring that
+ * all children are destroyed before their parent.
+ *
+ * Context: Called with the powercap hierarchy mutex held. The callback may
+ * sleep, but must not call powercap_hierarchy_create() or
+ * powercap_hierarchy_destroy() for the same hierarchy.
+ */
+typedef void (*powercap_node_destroy_t)(struct powercap_control_type *pct,
+					struct powercap_zone *zone,
+					void *data);
+
+/**
+ * powercap_hierarchy_destroy - Destroy a powercap hierarchy
+ * @pct: Powercap control type owning the hierarchy.
+ * @hierarchy: Hierarchy to destroy.
+ * @powercap_node_destroy: Callback used to destroy each powercap zone.
+ *
+ * Destroy all powercap zones previously created for @hierarchy. Nodes are
+ * destroyed in reverse array order so that children are removed before their
+ * parents.
+ *
+ * Entries whose &struct powercap_node.zone field is NULL are ignored. After
+ * a zone has been destroyed, its zone field is cleared.
+ *
+ * The caller must ensure that no users of the hierarchy remain when this
+ * function is called.
+ *
+ * Context: Process context. May sleep.
+ *
+ * Return: 0 on success or -EINVAL if an argument is invalid.
+ */
+int powercap_hierarchy_destroy(struct powercap_control_type *pct,
+			       struct powercap_hierarchy *hierarchy,
+			       powercap_node_destroy_t powercap_node_destroy);
+
+/**
+ * powercap_hierarchy_create - Create a powercap hierarchy
+ * @pct: Powercap control type that will own the hierarchy.
+ * @hierarchy: Hierarchy to create.
+ * @powercap_node_create: Callback used to create each powercap zone.
+ * @powercap_node_destroy: Callback used to roll back an incomplete hierarchy.
+ *
+ * Create the powercap zones described by @hierarchy in array order. For each
+ * entry, @powercap_node_create is called with the powercap zone stored in its
+ * parent entry. Root nodes are created with a NULL parent.
+ *
+ * Each parent entry must precede all its children in the node array. All zone
+ * fields must be NULL when this function is called.
+ *
+ * If a callback returns NULL, its node and all descendants are skipped.
+ * Their zone fields remain NULL, and independent branches are still created.
+ *
+ * If a callback returns an error pointer, all zones created by this invocation
+ * are destroyed in reverse order by calling @powercap_node_destroy. Therefore,
+ * @powercap_node_destroy must be provided even when the caller does not
+ * expect to destroy the hierarchy explicitly.
+ *
+ * The hierarchy and the objects referenced by its name and data fields must
+ * remain valid until powercap_hierarchy_destroy() has completed.
+ *
+ * Context: Process context. May sleep.
+ *
+ * Return: 0 on success, -EINVAL if an argument or hierarchy entry is invalid,
+ * -EBUSY if the hierarchy already contains a created zone, or the error
+ * returned by @powercap_node_create.
+ */
+int powercap_hierarchy_create(struct powercap_control_type *pct,
+			      struct powercap_hierarchy *hierarchy,
+			      powercap_node_create_t powercap_node_create,
+			      powercap_node_destroy_t powercap_node_destroy);
+
 #endif
-- 
2.43.0

