return {
	{
		"cenk1cenk2/schema-companion.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			log_level = vim.log.levels.INFO,
		},
		keys = {
			{
				"<leader>ks",
				function()
					require("schema-companion").select_schema()
				end,
				desc = "Schema: Select (manual)",
				mode = "n",
			},
		},
		config = function(_, opts)
			require("schema-companion").setup(opts)
		end,
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "cenk1cenk2/schema-companion.nvim" },
		opts = function(_, opts)
			opts.servers = opts.servers or {}

			opts.servers.jinja_lsp = {
				filetypes = { "jinja", "html" },
			}

			local yamlls_opts = vim.tbl_deep_extend("force", {}, opts.servers.yamlls or {}, {
				settings = {
					redhat = { telemetry = { enabled = false } },
					yaml = {
						validate = true,
						keyOrdering = false,
						format = { enable = true },
						hover = true,
						completion = true,
						schemaStore = {
							enable = false,
							url = "",
						},
					},
				},
			})

			local user_schemas = {
				-- Flux
				{
					name = "Flux HelmRepository (source.toolkit.fluxcd.io/v1)",
					uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/helmrepository-source-v1.json",
				},
				{
					name = "Flux HelmRelease (helm.toolkit.fluxcd.io/v2)",
					uri = "https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/helmrelease-helm-v2.json",
				},

				-- CNPG (Postgres)
				{
					name = "CNPG Backup (postgresql.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/postgresql.cnpg.io/backup_v1.json",
				},
				{
					name = "CNPG Cluster (postgresql.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/postgresql.cnpg.io/cluster_v1.json",
				},
				{
					name = "CNPG ClusterImageCatalog (postgresql.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/postgresql.cnpg.io/clusterimagecatalog_v1.json",
				},
				{
					name = "CNPG Database (postgresql.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/postgresql.cnpg.io/database_v1.json",
				},
				{
					name = "CNPG FailoverQuorum (postgresql.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/postgresql.cnpg.io/failoverquorum_v1.json",
				},
				{
					name = "CNPG ImageCatalog (postgresql.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/postgresql.cnpg.io/imagecatalog_v1.json",
				},
				{
					name = "CNPG Pooler (postgresql.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/postgresql.cnpg.io/pooler_v1.json",
				},
				{
					name = "CNPG Publication (postgresql.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/postgresql.cnpg.io/publication_v1.json",
				},
				{
					name = "CNPG ScheduledBackup (postgresql.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/postgresql.cnpg.io/scheduledbackup_v1.json",
				},
				{
					name = "CNPG Subscription (postgresql.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/postgresql.cnpg.io/subscription_v1.json",
				},

				-- Barman Cloud CNPG-I plugin — barmancloud.cnpg.io/v1
				{
					name = "CNPG Barman Cloud ObjectStore (barmancloud.cnpg.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/barmancloud.cnpg.io/objectstore_v1.json",
				},

				-- Cert-manager
				{
					name = "Cert-Manager Certificate (cert-manager.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cert-manager.io/certificate_v1.json",
				},
				{
					name = "Cert-Manager Issuer (cert-manager.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cert-manager.io/issuer_v1.json",
				},
				{
					name = "Cert-Manager ClusterIssuer (cert-manager.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cert-manager.io/clusterissuer_v1.json",
				},
				{
					name = "Cert-Manager CertificateRequest (cert-manager.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cert-manager.io/certificaterequest_v1.json",
				},

				--- SOPS
				{
					name = "Sops",
					uri = "https://raw.githubusercontent.com/getsops/sops/fb89aeaae6d1bc8cecab27d636f1650029702b39/schema/sops.json",
				},
				-- Cilium
				{
					name = "ciliumbgpadvertisement",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgpadvertisement_v2.json",
				},
				{
					name = "ciliumbgpadvertisement",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgpadvertisement_v2alpha1.json",
				},
				{
					name = "ciliumbgpclusterconfig",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgpclusterconfig_v2.json",
				},
				{
					name = "ciliumbgpclusterconfig",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgpclusterconfig_v2alpha1.json",
				},
				{
					name = "ciliumbgpnodeconfig",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgpnodeconfig_v2.json",
				},
				{
					name = "ciliumbgpnodeconfig",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgpnodeconfig_v2alpha1.json",
				},
				{
					name = "ciliumbgpnodeconfigoverride",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgpnodeconfigoverride_v2.json",
				},
				{
					name = "ciliumbgpnodeconfigoverride",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgpnodeconfigoverride_v2alpha1.json",
				},
				{
					name = "ciliumbgppeerconfig",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgppeerconfig_v2.json",
				},
				{
					name = "ciliumbgppeerconfig",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgppeerconfig_v2alpha1.json",
				},
				{
					name = "ciliumbgppeeringpolicy",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumbgppeeringpolicy_v2alpha1.json",
				},
				{
					name = "ciliumcidrgroup",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumcidrgroup_v2.json",
				},
				{
					name = "ciliumcidrgroup",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumcidrgroup_v2alpha1.json",
				},
				{
					name = "ciliumclusterwideenvoyconfig",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumclusterwideenvoyconfig_v2.json",
				},
				{
					name = "ciliumclusterwidenetworkpolicy",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumclusterwidenetworkpolicy_v2.json",
				},
				{
					name = "ciliumegressgatewaypolicy",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumegressgatewaypolicy_v2.json",
				},
				{
					name = "ciliumendpoint",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumendpoint_v2.json",
				},
				{
					name = "ciliumendpointslice",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumendpointslice_v2alpha1.json",
				},
				{
					name = "ciliumenvoyconfig",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumenvoyconfig_v2.json",
				},
				{
					name = "ciliumexternalworkload",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumexternalworkload_v2.json",
				},
				{
					name = "ciliumidentity",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumidentity_v2.json",
				},
				{
					name = "ciliuml2announcementpolicy",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliuml2announcementpolicy_v2alpha1.json",
				},
				{
					name = "ciliumloadbalancerippool",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumloadbalancerippool_v2.json",
				},
				{
					name = "ciliumloadbalancerippool",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumloadbalancerippool_v2alpha1.json",
				},
				{
					name = "ciliumlocalredirectpolicy",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumlocalredirectpolicy_v2.json",
				},
				{
					name = "ciliumnetworkpolicy",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumnetworkpolicy_v2.json",
				},
				{
					name = "ciliumnode",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumnode_v2.json",
				},
				{
					name = "ciliumnodeconfig",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumnodeconfig_v2.json",
				},
				{
					name = "ciliumnodeconfig",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumnodeconfig_v2alpha1.json",
				},
				{
					name = "ciliumpodippool",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cilium.io/ciliumpodippool_v2alpha1.json",
				},
				-- Kyverno
				{
					name = "Kyverno ClusterPolicy (kyverno.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/kyverno.io/clusterpolicy_v1.json",
				},
				{
					name = "Kyverno Policy (kyverno.io/v1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/kyverno.io/policy_v1.json",
				},
				{
					name = "Kyverno ClusterCleanupPolicy (kyverno.io/v2beta1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/kyverno.io/clustercleanuppolicy_v2beta1.json",
				},
				{
					name = "Kyverno CleanupPolicy (kyverno.io/v2beta1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/kyverno.io/cleanuppolicy_v2beta1.json",
				},
				{
					name = "Kyverno PolicyException (kyverno.io/v2beta1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/kyverno.io/policyexception_v2beta1.json",
				},
				{
					name = "Kyverno UpdateRequest (kyverno.io/v1beta1)",
					uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/kyverno.io/updaterequest_v1beta1.json",
				},
			}

			local k8s_base =
				"https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone-strict"

			local k8s_resources = {
				{ name = "Namespace", file = "namespace-v1" },
				{ name = "Deployment", file = "deployment-apps-v1" },
				{ name = "Service", file = "service-v1" },
				{ name = "Pod", file = "pod-v1" },
				{ name = "Ingress", file = "ingress-networking-v1" },
				{ name = "ConfigMap", file = "configmap-v1" },
				{ name = "Secret", file = "secret-v1" },
				{ name = "StatefulSet", file = "statefulset-apps-v1" },
				{ name = "DaemonSet", file = "daemonset-apps-v1" },
				{ name = "Job", file = "job-batch-v1" },
				{ name = "CronJob", file = "cronjob-batch-v1" },
				{ name = "PersistentVolume", file = "persistentvolume-v1" },
				{ name = "PVC", file = "persistentvolumeclaim-v1" },
				{ name = "ServiceAccount", file = "serviceaccount-v1" },
				{ name = "Role", file = "role-rbac-v1" },
				{ name = "RoleBinding", file = "rolebinding-rbac-v1" },
				{ name = "NetworkPolicy", file = "networkpolicy-networking-v1" },
				{ name = "HPA", file = "horizontalpodautoscaler-autoscaling-v2" },
				{ name = "ClusterRoleBinding", file = "clusterrolebinding-rbac-v1" },
			}

			for _, res in ipairs(k8s_resources) do
				table.insert(user_schemas, {
					name = "K8s " .. res.name,
					uri = k8s_base .. "/" .. res.file .. ".json",
				})
			end

			table.insert(user_schemas, {
				name = "Kubernetes (Full Cluster)",
				uri = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/master-standalone/all.json",
			})

			local sc = require("schema-companion")
			local adapter = sc.adapters.yamlls.setup({
				sources = {
					sc.sources.schemas.setup(user_schemas),

					sc.sources.matchers.kubernetes.setup({ version = "master" }),

					sc.sources.lsp.setup(),

					sc.sources.none.setup(),
				},
			})

			-- 5. Attach to Yamlls
			opts.servers.yamlls = sc.setup_client(adapter, yamlls_opts)
		end,
	},
}
