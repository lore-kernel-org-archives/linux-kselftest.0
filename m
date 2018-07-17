From: dave.hansen@intel.com (Dave Hansen)
Date: Tue, 17 Jul 2018 10:56:08 -0700
Subject: [PATCH v13 19/24] selftests/vm: associate key on a mapped page
 and detect access violation
In-Reply-To: <20180717161332.GH5790@ram.oc3035372033.ibm.com>
References: <1528937115-10132-1-git-send-email-linuxram@us.ibm.com>
 <1528937115-10132-20-git-send-email-linuxram@us.ibm.com>
 <048b1de9-85f8-22ff-a31a-b06a382769bb@intel.com>
 <20180717161332.GH5790@ram.oc3035372033.ibm.com>
Message-ID: <febe6668-c66a-4601-63da-44501faf12ee@intel.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180717175608.rBOqetNJIAvOwLWdDk_7iNMP55_h8TGU2VLl_qzR5qc@z>

On 07/17/2018 09:13 AM, Ram Pai wrote:
> I have incorporated almost all of your comments. But there are some
> comments that take some effort to implement. Shall we get the patches
> merged in the current form?  This code has been sitting out for a while.
> 
> In the current form its tested and works on powerpc and on x86, and
> incorporates about 95% of your suggestions. The rest I will take care
> as we go.

What constitutes the remaining 5%?
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
