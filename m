Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368B3497B76
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174071; cv=none; b=renep2Z0wbvHzFZf2Lpk+5uPiKx8nWPh2JG/jZFL6cKSt5rMqEeaWIQEC17qbq2eBBeGxUgnuPoFqWMXZEqbR1TDuAhR2B8h3c8p0QzqiCKUEq0Z27Z/Yey7kVWkqh2goMvCOBT8plB0yMtGKuic5HcRGh9cr62R9Z/AOLrAK9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174071; c=relaxed/simple;
	bh=BatmfZZ6C2Nbnc5WEKEG5CShdTZ5uNFtGdnGncCoaig=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPjolMRmfsm3uTiiR1YsKeKBNgX1nggwda/IBcCrnkmkOYjHVRXJtmQ/PXijhEdzlDc5lOHqxAczk/2R6iX/ayLqbPea/PUG4FELx35TSJkPv6FgfzzQhUHi1q1MZKJEQfXitYurzIlv3/PG7P/9nYVQI/U4Hp5eaWjR0nVGORQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/QhzGQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cm3RBfAQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/QhzGQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cm3RBfAQ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDk62Y2918785
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FaD+9jhjr91
	76lmiLwQWHTp00QqsOzUrO8NUDKxOUww=; b=P/QhzGQQhgFmJ3pLIHTK8DzToDU
	MYL/yAN/pVG6M4hFVQ+n5JMS+WPN1IVS6FjVK5sCm7tn8W6hpDfe/yaY/c2IYgU/
	B+b8jSt5aKfbS66t0tED4DOmmPmJirvbk1Q3YVFVQYtxNNoHNr5RARPF4jrkjMn8
	TwhUVAfkbDZe/wgj+56Y9QolN3oM5YpuONyIW+in5qA+GovOD/c7gUDcz08nGcQK
	hUru9NPxV1Qok1wpE/PaGYTSKfdvOGOEpGVfeeP2jAiy5JMwCYrqc3RA3dneARuG
	MZP5GroTuJ0cKqtosprpdJ7zjwCqnF2ChzdxR3emgOnUd0ykzByKZd8Y2/w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqj39p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 14:34:27 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-98331b577e4so788580241.1
        for <linux-kselftest@vger.kernel.org>; Wed, 23 Sep 2026 07:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790174067; x=1790778867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaD+9jhjr9176lmiLwQWHTp00QqsOzUrO8NUDKxOUww=;
        b=cm3RBfAQXPeQLxWUBKWppVK6XQOT1L+l1vE8Og2+8lWDjXXlkJTnPQFHabTN+WrE7D
         spvKkHtfAdN2wrb0lABisx13efLl4gtTsgvI0tZU+jJ7JtDcn1mCTfmpMTeIIY4BOieo
         IASNLWssLK2glisZ4fvxmUA9rjMceGOaGj8xkJXnXOwxtIavgmjAZ8VhVTzRClrzdR3V
         5VGaEhBw50NZLkpUQjArV1yvDNuCLg0cOZ5Aa03bf72/M49yzOwGoDyJ5BvekoP6ZMcv
         Dw2BWYtD/L9AB0+6dUJyoIAmt1MiO9tJTYQU+lyxGzbwiB6Y3iGGbogj7/6NqFrV3U1c
         Kcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174067; x=1790778867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FaD+9jhjr9176lmiLwQWHTp00QqsOzUrO8NUDKxOUww=;
        b=HYO+WgO7EOvi3+Wj7kgQpBHxxotd8q4S7TLGcQWV3goCXhKnE/yjzU1P9o4dRW/5sH
         j8YA2k4128euybJeT3Y0Iil0WAlc1wVosb95MIpecDLWYtZD71Vdvgo4XD1RP1mKDj3X
         paK+aRaP325HNbFwe9rV7BqZm81DH8VfSQHWwEKsQbVdZEjLoK2dMjaaXHOi8C7/GOwi
         32uH2JRC1KrBJuVa9+kvVF7heN2x9C4ta6FgIMssXDbw3tlanTpcAgosL4xl7aj6a1fM
         xCREitM6Vv4MTu5CVzKxVcJfZshKaeZ5g5a73rCq6X4oWNATvHQVV8dyjhPNssYosFJe
         rHWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw2fpABowBwfv6C1SV0+x9wnbJ2ej0JN70Vxmy/fCpwET4/sLxgqoFuFLaFV3yJ1lb8HrEacuYSUUtoxB2Cnww=@vger.kernel.org
X-Gm-Message-State: AFuF++mLKmDKvSHY7Vd++3uixVgYmsJYDPNnFmgHWaPmgrKcfj+VDGLZ
	rW0qpQQXNvYCn7JI5CtZPe98aeQKd8txFr3P3zmAd4nu8Zvpr0rBuhD/E7KLbRwtJD2oCiEG7On
	/AhCELApfIGaMTyOWBukieu4iKO3dQsJTBMOra+BkCgUtBYkWppskVzWwgMbFYwadobNKDXk=
X-Gm-Gg: AYBFou1iO4R4KUMXzOFFYmMfzTeXQ3ehinx7+Wiw/7TdBuSiRyhT75pR0kx6OlY4OZG
	iKNs9+YtW9NxORTtyZLrmRm9dAlqZxcazL4qzYyYwgRP3xCTxPQ+fw55Ey58s2iXLkZT5D8PNel
	BdrMnk5p2cGtQ9+QSkGlSnzNzk6PxEwnOSuE1sOUCWEzcoJ5wTa6KLIa0hUCv5GgglPLnBSZcME
	b+8k/tmaedxjGX83yVmurntAXsVZdHztTZncYZvvMoouT1J0Wo/AkpZW95UShTrGwRhozt4o18F
	5+bkbDgPBHwLxTbYIPvZNMxjwO2YsUaSNeD/K5mAoo4xsXOew1gdH5fivJkgQOWeR6z/8ZEpCO4
	9rtDmBtp37me++gD+Mbr/512uTgk=
X-Received: by 2002:a05:6102:54ab:b0:7a1:f7c3:3a45 with SMTP id ada2fe7eead31-7ac1c999f8emr2639018137.18.1790174066664;
        Wed, 23 Sep 2026 07:34:26 -0700 (PDT)
X-Received: by 2002:a05:6102:54ab:b0:7a1:f7c3:3a45 with SMTP id ada2fe7eead31-7ac1c999f8emr2638987137.18.1790174066013;
        Wed, 23 Sep 2026 07:34:26 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:a913:ba43:96d7:743c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf158147sm58213905e9.0.2026.09.23.07.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:34:25 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: linux-pm@vger.kernel.org, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com
Subject: [PATCH v2 1/6] powercap: Add generic zone hierarchy creation helpers
Date: Wed, 23 Sep 2026 16:34:11 +0200
Message-ID: <20260923143416.3713485-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923143416.3713485-1-daniel.lezcano@oss.qualcomm.com>
References: <20260923143416.3713485-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jjZZE-WSWuEqIGG5uFhdpOLP1_U61smD
X-Proofpoint-ORIG-GUID: jjZZE-WSWuEqIGG5uFhdpOLP1_U61smD
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3e374 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=jGdnt-AriNhNVhWiu9AA:9 a=o1xkdb1NAhiiM49bd1HK:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX7ei6Sflbe/5G
 z8b7PI7vlySMuEO8sZgz0HKsInX08HWMCv8g8L5xPzqqFmGIGAw+fDAJd4F/jISadSDE0oIJvZt
 ol4WUK5q+fMRrOPkCuiMwl5s4At23pU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX4syuYHQEl9OA
 sNeEe1l2W5wwGceuu86v9HnLO44kO9JSAmfDhKAgoXepYygVZFUIUqcXwlbsVn5QDPMh3fc69qH
 AGPQg9+belvnxkccGS440akBr4vQpU98tMlLdsHbDGmFED4CJP3fTKCJEfshGuCrtl9A1pvpL9k
 3CYaB2nH3iucteNdv8LvN+CCAQ9E0GTAZ/2NvwcdeCdo5CBnYzM5TFTB/mbJ9Q+2tj+D5FAlcLv
 8+t7fP7III0Ct/uO1rOScob0tDV7QGtXUIvBGkFtuFSjB+RCUYiuAGZFU8vR5sl6kHoWdXu5Guz
 9ZJFQyo4hGXuLABsoLV37/igaBlCerc6smYK8HexFRzWkR1e8bCk+BitGV227JCwTskcDrpre+u
 jSyXIBQCWALiAq/1OHPPlgObcrOUe022O595B2rSB0fNwluP5dDTaiDhSLowm0iOPwr55Mjsp+b
 izlkfnv2mvzkqlwUCcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058

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

  static struct powercap_hierarchy hierarchy = {
          .nodes = nodes,
          .nr_nodes = ARRAY_SIZE(nodes),
  };

creates the following hierarchy:

  package
  |-- cpu
  `-- gpu

Add powercap_hierarchy_dup() to create a runtime copy of a hierarchy
description. Rebase the parent pointers so that the copy does not keep
references to the original array, which may be stored in init memory.

Add powercap_hierarchy_create() to walk the description in order
and create each zone through a controller-provided callback. The parent
zone is passed to the callback, keeping the node creation operation
specific to the controller.

The backend is responsible for allocating and registering each powercap
zone from the creation callback. The powercap_zone object is expected to
be embedded in a backend-specific structure, allowing the backend
callbacks to retrieve their private data later using container_of().

For example:

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

Its allocation, private state and lifetime remain under the control of
the backend.

The creation callback therefore returns the same powercap_zone pointer
that was passed to powercap_register_zone(). The hierarchy helper stores
this pointer to provide it as the parent of subsequent nodes and to pass
it back to the backend during hierarchy destruction.

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
---
 drivers/powercap/powercap_sys.c | 148 ++++++++++++++++++++++++++
 include/linux/powercap.h        | 178 ++++++++++++++++++++++++++++++++
 2 files changed, 326 insertions(+)

diff --git a/drivers/powercap/powercap_sys.c b/drivers/powercap/powercap_sys.c
index 9197fa20d93f..fefb36c5bcd2 100644
--- a/drivers/powercap/powercap_sys.c
+++ b/drivers/powercap/powercap_sys.c
@@ -667,6 +667,154 @@ int powercap_unregister_control_type(struct powercap_control_type *control_type)
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
+		copy->nodes[i].pcz = NULL;
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
+	size_t i;
+
+	for (i = hierarchy->nr_nodes; i-- > 0;) {
+		if (!hierarchy->nodes[i].pcz)
+			continue;
+
+		powercap_node_destroy(pct, hierarchy->nodes[i].pcz,
+				      hierarchy->nodes[i].data);
+
+		hierarchy->nodes[i].pcz = NULL;
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
+	guard(mutex)(&hierarchy->lock);
+
+	__powercap_hierarchy_destroy(pct, hierarchy, powercap_node_destroy);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(powercap_hierarchy_destroy);
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
+	guard(mutex)(&hierarchy->lock);
+
+	for (i = 0; i < hierarchy->nr_nodes; i++) {
+		struct powercap_zone *parent = NULL;
+
+		if (hierarchy->nodes[i].parent) {
+			parent = hierarchy->nodes[i].parent->pcz;
+			if (!parent) {
+				ret = -EINVAL;
+				goto rollback;
+			}
+		}
+
+		pcz = powercap_node_create(pct, hierarchy->nodes[i].name,
+					   hierarchy->nodes[i].data, parent);
+		if (IS_ERR_OR_NULL(pcz)) {
+			ret = pcz ? PTR_ERR(pcz) : -EINVAL;
+			goto rollback;
+		}
+
+		hierarchy->nodes[i].pcz = pcz;
+	}
+
+	return 0;
+
+rollback:
+	__powercap_hierarchy_destroy(pct, hierarchy, powercap_node_destroy);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(powercap_hierarchy_create);
+
 static int __init powercap_init(void)
 {
 	int result;
diff --git a/include/linux/powercap.h b/include/linux/powercap.h
index 603419db924c..939cd58dff4f 100644
--- a/include/linux/powercap.h
+++ b/include/linux/powercap.h
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/idr.h>
+#include <linux/mutex.h>
 
 /*
  * A power cap class device can contain multiple powercap control_types.
@@ -309,4 +310,181 @@ struct powercap_zone *powercap_register_zone(
 int powercap_unregister_zone(struct powercap_control_type *control_type,
 				struct powercap_zone *power_zone);
 
+/**
+ * struct powercap_node - Description of a node in a powercap hierarchy
+ * @name: Name of the powercap zone.
+ * @parent: Parent node, or NULL if the node is a hierarchy root.
+ * @pcz: Powercap zone created for this node. This field is managed by the
+ *	 hierarchy creation and destruction helpers.
+ * @data: Private data passed unchanged to the creation and destruction
+ *	  callbacks.
+ *
+ * This structure describes one node of a powercap hierarchy. The backend
+ * supplies an array of nodes through &struct powercap_hierarchy.
+ *
+ * Nodes must be ordered so that a parent appears before all its children.
+ *
+ * The @name and @data objects must remain valid until the duplicated hierarchy
+ * has been freed. The @parent pointer is rebased by powercap_hierarchy_dup(),
+ * allowing the original node array to be released after duplication.
+ *
+ * The @pcz field is runtime state managed by powercap_hierarchy_create() and
+ * powercap_hierarchy_destroy(). It is cleared when a node is destroyed.
+ */
+struct powercap_node {
+	const char *name;
+	struct powercap_node *parent;
+	struct powercap_zone *pcz;
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
+ */
+struct powercap_hierarchy {
+	struct powercap_node *nodes;
+	size_t nr_nodes;
+	struct mutex lock;
+};
+
+/**
+ * powercap_hierarchy_dup - Duplicate a powercap hierarchy description
+ * @hierarchy: Hierarchy description to duplicate.
+ *
+ * Allocate a runtime hierarchy and copy the nodes from @hierarchy. Parent
+ * pointers are rebased to the duplicated node array and the runtime pcz fields
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
+ * Return: A valid pointer to the created powercap zone on success, or an
+ * ERR_PTR() encoded error on failure.
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
+ * Entries whose &struct powercap_node.pcz field is NULL are ignored. After
+ * a zone has been destroyed, its pcz field is cleared.
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
+ * Each parent entry must precede all its children in the node array. All pcz
+ * fields must be NULL when this function is called.
+ *
+ * If a node cannot be created, all zones created by this invocation are
+ * destroyed in reverse order by calling @powercap_node_destroy. Therefore,
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

