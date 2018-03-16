From: dave.hansen@intel.com (Dave Hansen)
Date: Fri, 16 Mar 2018 15:15:15 -0700
Subject: [PATCH v12 10/22] selftests/vm: introduce two arch independent
 abstraction
In-Reply-To: <1519264541-7621-11-git-send-email-linuxram@us.ibm.com>
References: <1519264541-7621-1-git-send-email-linuxram@us.ibm.com>
 <1519264541-7621-11-git-send-email-linuxram@us.ibm.com>
Message-ID: <b3a58839-6ded-16eb-79c5-cd26f89790bc@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180316221515.I_ZK2MlhZDoUWB2HYPAC1Hkf-FWBhu6lI9fPxKyoHMc@z>

On 02/21/2018 05:55 PM, Ram Pai wrote:
> open_hugepage_file() <- opens the huge page file
> get_start_key() <--  provides the first non-reserved key.
> 

Looks reasonable.

Reviewed-by: Dave Hansen <dave.hansen at intel.com>

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
