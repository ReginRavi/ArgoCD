# Access Guide for Observability Platform

## 🎯 Quick Access

All services are now running and accessible via port-forwarding. You should have three terminal sessions running:

### 1. **Grafana** - Main Dashboard
- **URL**: http://localhost:3000
- **Username**: `admin`
- **Password**: `admin`
- **What it does**: Visualize metrics, logs, and traces from all your services
- **Pre-configured datasources**:
  - Prometheus (metrics)
  - Loki (logs)
  - Tempo (traces)

### 2. **Argo CD** - GitOps Dashboard
- **URL**: https://localhost:8080
- **Username**: `admin`
- **Password**: Run `make get-passwords` to retrieve
- **What it does**: Manage and monitor your Kubernetes applications via GitOps

### 3. **Prometheus** - Metrics Database
- **URL**: http://localhost:9090
- **What it does**: Query raw metrics and explore PromQL queries
- **Try this query**: `up` (shows all targets being monitored)

## 📊 What's Deployed

Your observability stack includes:

- **Prometheus**: Metrics collection and storage
- **Grafana**: Visualization and dashboards
- **Loki**: Log aggregation
- **Tempo**: Distributed tracing
- **Alertmanager**: Alert handling
- **Node Exporter**: System metrics
- **Kube State Metrics**: Kubernetes cluster metrics

## 🔍 Next Steps

1. **Explore Grafana**:
   - Go to http://localhost:3000
   - Navigate to "Explore" to query Prometheus metrics
   - Try importing pre-built dashboards from Grafana.com

2. **Check Argo CD**:
   - Go to https://localhost:8080
   - View the sync status of all applications
   - See the health of deployed resources

3. **Query Prometheus**:
   - Go to http://localhost:9090
   - Try queries like:
     - `node_cpu_seconds_total` - CPU metrics
     - `container_memory_usage_bytes` - Memory usage
     - `up` - Service availability

## 🛠️ Troubleshooting

If any service is not accessible:

1. Check if the port-forward is still running
2. Verify pods are running: `kubectl get pods -n monitoring`
3. Check application status: `kubectl get applications -n argocd`
4. Restart port-forward if needed using the Makefile commands

## 📝 Useful Commands

```bash
# View all services
kubectl get svc -n monitoring

# View all pods
kubectl get pods -n monitoring

# View Argo CD applications
kubectl get applications -n argocd

# Get Argo CD password
make get-passwords

# Restart port-forwards (run each in separate terminal)
make port-forward-grafana
make port-forward-argocd
make port-forward-prometheus
```
